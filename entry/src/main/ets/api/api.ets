import { httpGet, httpPost } from '../utils/request';
// 购票、登出无data返回专用空类型
interface EmptyData {}
// 全局统一返回结构（固定泛型，杜绝裸对象类型声明报错）
interface BaseResponse<T> {
  code: number;
  msg: string;
  data: T;
  total?: number;
}

// ================== POST请求专用入参类型 ==================
interface LoginReq {
  username: string; // 改成 username，匹配 Apifox 条件 Mock 的字段名
  password: string;
}
interface LoginResData {
  token?: string; // 改为可选：条件 Mock 成功时只返回 code+msg，没有 token 字段
}
interface BuyTicketReq {
  show_id: number;
  ticket_level_id: number;
}

// ================== 页面渲染实体类型 ==================
interface ShowItem {
  id: number;
  singer_name: string;
  city: string;
  category: string;
  show_time: string;
  venue: string;
  is_sale: number;
  cover_img: string;
  min_price: number;
}
interface OrderItem {
  id: number;
  show_name: string;
  seat_info: string;
  price: number;
  create_time: string;
}

// ================== 6个接口（GET用Record标注，完美匹配工具函数参数） ==================
// 1.演出分页列表
export function getShowList(page: number, pageSize: number) {
  // 强制标注Record类型，同时不写裸字面量
  const queryParams: Record<string, number> = {};
  queryParams.page = page;
  queryParams.pageSize = pageSize;
  return httpGet<BaseResponse<ShowItem[]>>("/api/show/list", queryParams);
}

// 2.演出关键词搜索
export function searchShow(keyword: string) {
  const queryParams: Record<string, string> = {};
  queryParams.keyword = keyword;
  return httpGet<BaseResponse<ShowItem[]>>("/api/show/search", queryParams);
}

// 3.用户登录
export function userLogin(username: string, password: string) {
  const reqBody: LoginReq = {
    username: username,
    password: password
  };
  return httpPost<BaseResponse<LoginResData>>("/api/user/login", reqBody);
}

// 4.用户登出
export function userLogout() {
  return httpPost<BaseResponse<null>>("/api/user/logout");
}

// 5.购票下单
export function buyTicket(show_id: number, ticket_level_id: number) {
  const reqBody: BuyTicketReq = {
    show_id: show_id,
    ticket_level_id: ticket_level_id
  };
  return httpPost<BaseResponse<EmptyData>>("/api/ticket/buy", reqBody);
}

// 6.我的订单
export function getMyOrder() {
  return httpGet<BaseResponse<OrderItem[]>>("/api/order/my");
}