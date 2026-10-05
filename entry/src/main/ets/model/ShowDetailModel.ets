/**
 * 演出详情页（pages/third.ets）数据模型
 * 集中管理演出详情页写死的静态文案与底部操作数据。
 */

/**
 * 演出详情结构
 */
export interface ShowDetail {
  titleTop: string;    // 标题前半段
  titleBottom: string; // 标题后半段
  priceRange: string;  // 票价区间
  date: string;        // 演出日期
  duration: string;    // 演出时长
  venue: string;       // 场馆名称
  address: string;     // 场馆地址
}

/**
 * 底部操作项结构
 */
export interface BottomAction {
  icon: ResourceStr; // 图标资源
  label: string;     // 操作名称
}

/**
 * 演出详情数据
 */
export const SHOW_DETAIL: ShowDetail = {
  titleTop: "青岛·2026陈粒【一",
  titleBottom: "粒】十周年巡回演唱会-青岛站",
  priceRange: "399-999",
  date: "2026.06.27-06.28",
  duration: "不低于120分钟（以现场为准）",
  venue: "青岛市·青岛市民健身中心体育馆",
  address: "高新区火炬路318号·5个演出"
};

/**
 * 底部操作栏数据
 */
export const BOTTOM_ACTIONS: BottomAction[] = [
  { icon: $r('app.media.bz'), label: "帮助" },
  { icon: $r('app.media.xk'), label: "想看" }
];

/**
 * 购票页所需的演出信息（与 gp 购票页 / Apifox 接口返回结构对齐）
 */
export interface ShowItem {
  id: number;          // 演出ID
  singer_name: string; // 歌手/艺人名
  city: string;        // 城市
  category: string;    // 演出类型
  show_time: string;   // 演出时间
  venue: string;       // 演出场馆
  min_price: number;   // 最低票价
}

/**
 * 陈粒演唱会购票信息（详情页点击“立即预订”时传入购票页）
 */
export const CHENLI_SHOW: ShowItem = {
  id: 1,
  singer_name: "陈粒",
  city: "青岛",
  category: "演唱会",
  show_time: "2026.06.27-06.28",
  venue: "青岛市·青岛市民健身中心体育馆",
  min_price: 399
};
