/**
 * 订单页（pages/dingdan.ets、pages/dingdan-yuan.ets）数据模型
 * 集中管理订单页写死的标签/筛选静态数据。
 */

/**
 * 订单分类标签结构
 */
export interface OrderTab {
  name: string;    // 标签名称
  active: boolean; // 是否选中（仅首个标签为选中态）
}

/**
 * 订单分类标签列表
 */
export const ORDER_TABS: OrderTab[] = [
  { name: "演出/门票", active: true },
  { name: "团购券", active: false },
  { name: "电影", active: false },
  { name: "小食", active: false },
  { name: "商城", active: false },
  { name: "大麦VIP速通卡", active: false }
];

/**
 * 订单状态筛选标签列表（首个为选中态）
 */
export const ORDER_FILTERS: string[] = ["全部", "待付款", "待收货", "待评价"];
