/**
 * 购票页（pages/gp.ets）数据模型
 * 集中管理购票页写死的静态数据，实现视图与数据分离。
 */

/**
 * 座位档位数据结构
 */
export interface SeatLevel {
  id: number;    // 档位ID，与后端购票接口 ticket_level_id 对齐
  name: string;  // 档位名称
}

/**
 * 可选座位档位列表
 */
export const SEAT_LEVELS: SeatLevel[] = [
  { id: 1, name: "内场A区" },
  { id: 2, name: "看台B区" },
  { id: 3, name: "山顶C区" }
];
