import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';

// 定义搜索结果的接口，替代 any
export interface SearchResult {
  id: number;
  name: string;
  price?: number;
}

// 搜索历史项接口
export interface SearchHistoryItem {
  keyword: string;  // 搜索关键词
  time: number;     // 搜索时间戳（毫秒）
}

// ---------------- 配置项 ----------------
const DB_NAME = 'SearchDB.db';
const TABLE_HISTORY = 'search_history';
const COL_ID = 'id';
const COL_KEYWORD = 'keyword';
const COL_TIME = 'search_time';

export class SearchDB {
  private rdbStore: relationalStore.RdbStore | null = null;
  private context: common.UIAbilityContext;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  // 1. 初始化数据库
  async initDB(): Promise<void> {
    const config: relationalStore.StoreConfig = {
      name: DB_NAME,
      securityLevel: relationalStore.SecurityLevel.S1
    };

    try {
      this.rdbStore = await relationalStore.getRdbStore(this.context, config);
      console.log("数据库初始化成功");

      // 去掉 await，executeSql 不是异步方法
      const createTableSql = `CREATE TABLE IF NOT EXISTS ${TABLE_HISTORY} (
        ${COL_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${COL_KEYWORD} TEXT UNIQUE NOT NULL,
        ${COL_TIME} INTEGER NOT NULL
      )`;
      this.rdbStore.executeSql(createTableSql);
      console.log("搜索历史表创建完成");

    } catch (err) {
      console.error("数据库初始化失败：", JSON.stringify(err));
    }
  }

  // 2. 插入/更新搜索历史
  async saveSearchHistory(keyword: string): Promise<void> {
    if (!this.rdbStore || !keyword.trim()) return;

    const nowTime = new Date().getTime();
    // 分开赋值，避免动态对象 key 报错
    const values: Record<string, number | string> = {};
    values[COL_KEYWORD] = keyword.trim();
    values[COL_TIME] = nowTime;

    await this.rdbStore.insert(
      TABLE_HISTORY,
      values as relationalStore.ValuesBucket,
      relationalStore.ConflictResolution.ON_CONFLICT_REPLACE
    );
    console.log("保存搜索历史成功：", keyword);
  }

  // 3. 查询所有搜索历史（按时间倒序，最新搜索置顶）
  async queryAllHistory(): Promise<SearchHistoryItem[]> {
    if (!this.rdbStore) return [];

    const predicates = new relationalStore.RdbPredicates(TABLE_HISTORY);
    predicates.orderByDesc(COL_TIME);
    const resultSet = await this.rdbStore.query(predicates, [COL_KEYWORD, COL_TIME]);

    const historyList: SearchHistoryItem[] = [];
    while (resultSet.goToNextRow()) {
      historyList.push({
        keyword: resultSet.getString(0) || '',
        time: resultSet.getLong(1)
      });
    }
    resultSet.close();
    return historyList;
  }

  // 4. 搜索匹配本地数据（用定义好的 SearchResult 替代 any）
  async searchLocalData(keyword: string): Promise<SearchResult[]> {
    if (!this.rdbStore || !keyword.trim()) return [];

    const TABLE_GOODS = 'goods';
    const predicates = new relationalStore.RdbPredicates(TABLE_GOODS);
    predicates.like('name', `%${keyword.trim()}%`);
    const resultSet = await this.rdbStore.query(predicates);

    const resultList: SearchResult[] = [];
    while (resultSet.goToNextRow()) {
      resultList.push({
        id: resultSet.getLong(0),
        name: resultSet.getString(1),
        price: resultSet.getDouble(2)
      });
    }
    resultSet.close();
    return resultList;
  }

  // 5. 清空全部搜索历史
  clearAllHistory(): void {
    if (!this.rdbStore) return;
    this.rdbStore.executeSql(`DELETE FROM ${TABLE_HISTORY}`);
    console.log("清空搜索历史成功");
  }
}