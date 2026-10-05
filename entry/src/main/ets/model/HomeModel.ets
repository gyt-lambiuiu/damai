/**
 * 首页（pages/second.ets）数据模型
 * 集中管理首页写死的分类宫格、分类频道、轮播图等静态数据。
 */

/**
 * 分类宫格项结构
 * 每个分类图标的尺寸与边距存在差异，故以可选字段保留，缺省时取默认值。
 */
export interface CategoryItem {
  icon: ResourceStr;       // 图标资源
  name: string;            // 分类名称
  imgWidth: number;        // 图标宽度
  imgHeight: number;       // 图标高度
  marginBottom?: number;   // 图标下边距，默认 5
  marginLeft?: number;     // 图标左边距，默认 0
  marginTop?: number;      // 图标上边距，默认 0
  textMarginLeft?: number; // 文字左边距，默认 0
  hasPadding?: boolean;    // 是否保留内边距 10，默认 true
}

/**
 * 首页分类宫格数据
 */
export const HOME_CATEGORIES: CategoryItem[] = [
  { icon: $r('app.media.ych'), name: "演唱会", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.yyj'), name: "音乐节", imgWidth: 35, imgHeight: 35, marginLeft: 5 },
  { icon: $r('app.media.hj'), name: "话剧音乐剧", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.live'), name: "Livehouse", imgWidth: 33, imgHeight: 33, marginBottom: 7 },
  { icon: $r('app.media.dy'), name: "电影", imgWidth: 35, imgHeight: 35, marginBottom: 4 },
  { icon: $r('app.media.wdwj'), name: "舞蹈舞剧", imgWidth: 33, imgHeight: 33, marginBottom: 7 },
  { icon: $r('app.media.jd'), name: "景点乐园", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.xj'), name: "喜剧脱口秀", imgWidth: 50, imgHeight: 50, marginBottom: -3, marginLeft: 19, hasPadding: false },
  { icon: $r('app.media.ty'), name: "体育", imgWidth: 40, imgHeight: 40, marginBottom: 2, marginTop: -5, marginLeft: 3 },
  { icon: $r('app.media.xsqy'), name: "相声曲艺", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.cjsyc'), name: "沉浸式演出", imgWidth: 33, imgHeight: 33, marginLeft: 5, textMarginLeft: 9 },
  { icon: $r('app.media.qqyc'), name: "全球演出", imgWidth: 33, imgHeight: 33, marginLeft: 19, textMarginLeft: 15 },
  { icon: $r('app.media.zl'), name: "展览", imgWidth: 33, imgHeight: 33, marginLeft: 4 },
  { icon: $r('app.media.dmbd'), name: "大麦榜单", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.yyh'), name: "音乐会", imgWidth: 33, imgHeight: 33, marginLeft: 4 },
  { icon: $r('app.media.xchl'), name: "现场壕礼", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.etqz'), name: "儿童亲子", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.zbsc'), name: "周边商城", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.ycrl'), name: "演出日历", imgWidth: 33, imgHeight: 33 },
  { icon: $r('app.media.qb'), name: "全部", imgWidth: 33, imgHeight: 33, marginLeft: 6, textMarginLeft: 3 }
];

/**
 * 首页分类频道标签
 */
export const HOME_CHANNELS: string[] = [
  "推荐", "演唱会", "音乐节", "脱口秀", "Livehouse", "话剧音乐剧", "电影",
  "体育赛事", "展览", "音乐会", "沉浸式演出", "儿童亲子", "曲苑杂坛"
];

/**
 * 首页顶部轮播图
 */
export const HOME_BANNERS: ResourceStr[] = [
  $r('app.media.1'),
  $r('app.media.2'),
  $r('app.media.3'),
  $r('app.media.4'),
  $r('app.media.5')
];
