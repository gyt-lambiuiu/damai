import http from '@ohos.net.http';
import preferences from '@ohos.data.preferences';
import common from '@ohos.app.ability.common';

// 【重点】替换为你修改后的模拟器可用Mock地址
const BASE_URL = "http://10.0.2.2:4523/m1/8469387-8241802-default";
let pref: preferences.Preferences | null = null;

/**
 * 在EntryAbility的onCreate中执行一次初始化
 */
export function initStorage(context: common.UIAbilityContext): void {
  preferences.getPreferences(context, "user_token_info").then(res => {
    pref = res;
  }).catch((err:Error) => {
    console.error("本地存储初始化失败", JSON.stringify(err));
  })
}

/**
 * 获取本地Token
 */
async function getToken(): Promise<string> {
  if (!pref) return "";
  const val = pref.getSync("token", "");
  return val.toString();
}

/**
 * 登录成功后保存Token
 */
export async function saveToken(token: string): Promise<void> {
  if (pref) {
    await pref.put("token", token);
    await pref.flush();
  }
}

/**
 * 登出清空Token
 */
export async function clearToken(): Promise<void> {
  if (pref) {
    await pref.delete("token");
    await pref.flush();
  }
}

/**
 * 手动拼接Get请求参数，解决鸿蒙不兼容浏览器URLSearchParams API
 */
// 单独定义参数类型，规避typeof查询报错
type ParamsType = Record<string, string | number>;
function buildQueryParams(params: ParamsType): string {
  const paramList: string[] = [];
  // 不再使用typeof params，替换为提前定义的ParamsType
  const keys = Object.keys(params) as Array<keyof ParamsType>;
  for (const key of keys) {
    const k = encodeURIComponent(key);
    const v = encodeURIComponent(String(params[key]));
    paramList.push(`${k}=${v}`);
  }
  return paramList.join('&');
}

/**
 * 底层通用请求方法
 */
async function baseRequest<T>(
  url: string,
  method: http.RequestMethod,
  queryParams?: Record<string, string | number>,
  body?: Object
): Promise<T> {
  const token = await getToken();
  let fullUrl = BASE_URL + url;

  if (method === http.RequestMethod.GET && queryParams) {
    const queryStr = buildQueryParams(queryParams);
    fullUrl += `?${queryStr}`;
  }

  const httpClient = http.createHttp();
  const header: Record<string, string> = {
    "Content-Type": "application/json"
  };
  // 自动挂载鉴权头，和Apifox全局Authorization对应
  if (token) {
    header["Authorization"] = token;
  }

  try {
    const response = await httpClient.request(fullUrl, {
      method: method,
      header: header,
      extraData: body ? JSON.stringify(body) : undefined,
      connectTimeout: 10000,
      readTimeout: 10000
    })
    httpClient.destroy();
    const result = JSON.parse(response.result as string) as Record<string, Object>;

    // 未登录拦截，对应后端401状态码
    if (result.code === 401) {
      await clearToken();
      throw new Error("未登录，请前往登录页面");
    }
    return result as T;
  } catch (error) {
    httpClient.destroy();
    console.error("网络请求异常", JSON.stringify(error));
    throw new Error("未登录，请前往登录页面");
  }
}

// 对外导出标准GET/POST方法
export function httpGet<T>(url: string, params?: Record<string, string | number>): Promise<T> {
  return baseRequest<T>(url, http.RequestMethod.GET, params);
}

export function httpPost<T>(url: string, body?: Object): Promise<T> {
  return baseRequest<T>(url, http.RequestMethod.POST, undefined, body);
}