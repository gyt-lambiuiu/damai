/**
 * 我的页（pages/Index.ets）数据模型
 * 集中管理我的页写死的订单入口、服务宫格、轮播图等静态数据。
 */

/**
 * 订单入口结构
 */
export interface OrderEntry {
  icon: ResourceStr;   // 图标资源
  name: string;        // 入口名称
  pagePath?: string;   // 跳转路径（可选，仅需要跳转的入口填写）
}

/**
 * 服务宫格项结构
 */
export interface ServiceItem {
  icon: ResourceStr; // 图标资源
  name: string;      // 服务名称
}

/**
 * 订单入口列表
 */
export const ORDER_ENTRIES: OrderEntry[] = [
  { icon: $r('app.media.fk'), name: "我的订单", pagePath: "pages/dingdan" },
  { icon: $r('app.media.yhq'), name: "优惠券" },
  { icon: $r('app.media.gyr'), name: "观演人" },
  { icon: $r('app.media.dz'), name: "收货地址" }
];

/**
 * 服务宫格列表
 */
export const SERVICE_ITEMS: ServiceItem[] = [
  { icon: $r('app.media.gyr'), name: "观演人" },
  { icon: $r('app.media.kf'), name: "在线客服" },
  { icon: $r('app.media.scg'), name: "周边商城" },
  { icon: $r('app.media.gytg'), name: "观演团" },
  { icon: $r('app.media.dybc'), name: "电影包场" },
  { icon: $r('app.media.yhfk'), name: "用户反馈" },
  { icon: $r('app.media.smrz'), name: "实名认证" },
  { icon: $r('app.media.gy'), name: "公益三小时" },
  { icon: $r('app.media.dzqb'), name: "电子钱包" },
  { icon: $r('app.media.dm'), name: "大麦VIP卡" },
  { icon: $r('app.media.th'), name: "特惠专区" }
];

/**
 * 我的页轮播图列表
 */
export const PROFILE_BANNERS: ResourceStr[] = [
  $r('app.media.tp1'),
  $r('app.media.tp2'),
  $r('app.media.tp3'),
  $r('app.media.tp4')
];
