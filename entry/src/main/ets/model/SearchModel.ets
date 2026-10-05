/**
 * 搜索页（pages/SearchPage.ets）数据模型
 * 集中管理搜索页写死的榜单、猜你想搜等静态数据，后续可替换为后端接口返回。
 */

/**
 * 热搜榜单项结构
 */
export interface HotRankItem {
  rank: number;    // 排名（1-10）
  keyword: string; // 热搜关键词
}

/**
 * 榜单卡片结构（横向滚动的每一张卡片）
 */
export interface RankBoard {
  title: string;        // 榜单标题
  items: HotRankItem[]; // 榜单条目（10 条）
}

/**
 * 榜单数据：全国热搜榜 / 同城玩乐榜 / 电影热搜榜，各 10 条 mock 数据
 */
export const RANK_BOARDS: RankBoard[] = [
  {
    title: "全国热搜榜",
    items: [
      { rank: 1, keyword: "周杰伦" },
      { rank: 2, keyword: "邓紫棋" },
      { rank: 3, keyword: "陈奕迅" },
      { rank: 4, keyword: "五月天" },
      { rank: 5, keyword: "林俊杰" },
      { rank: 6, keyword: "张杰" },
      { rank: 7, keyword: "薛之谦" },
      { rank: 8, keyword: "凤凰传奇" },
      { rank: 9, keyword: "刀郎" },
      { rank: 10, keyword: "华晨宇" }
    ]
  },
  {
    title: "同城玩乐榜",
    items: [
      { rank: 1, keyword: "邓紫棋演唱会" },
      { rank: 2, keyword: "音乐节" },
      { rank: 3, keyword: "脱口秀" },
      { rank: 4, keyword: "话剧音乐剧" },
      { rank: 5, keyword: "Livehouse" },
      { rank: 6, keyword: "沉浸式演出" },
      { rank: 7, keyword: "展览" },
      { rank: 8, keyword: "体育赛事" },
      { rank: 9, keyword: "儿童亲子" },
      { rank: 10, keyword: "景点乐园" }
    ]
  },
  {
    title: "电影热搜榜",
    items: [
      { rank: 1, keyword: "热映电影" },
      { rank: 2, keyword: "寒战1994" },
      { rank: 3, keyword: "星球大战" },
      { rank: 4, keyword: "消失的人" },
      { rank: 5, keyword: "给阿嬷的情" },
      { rank: 6, keyword: "今晚正好" },
      { rank: 7, keyword: "记忆碎片" },
      { rank: 8, keyword: "绵羊侦探团" },
      { rank: 9, keyword: "一个男人和" },
      { rank: 10, keyword: "错过的人" }
    ]
  }
];

/**
 * 猜你想搜关键词（静态 mock）
 */
export const GUESS_WORDS: string[] = [
  "周杰伦", "演唱会", "陈奕迅", "音乐节", "话剧",
  "邓紫棋", "脱口秀", "展览", "林俊杰", "Livehouse"
];
