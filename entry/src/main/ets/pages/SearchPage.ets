import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import { SearchDB, SearchResult, SearchHistoryItem } from '../SearchDB';
import { RANK_BOARDS, RankBoard, HotRankItem, GUESS_WORDS } from '../model/SearchModel';

@Entry
@Component
struct SearchPage {
  private db: SearchDB | null = null;
  @State searchKeyword: string = '';
  @State historyList: SearchHistoryItem[] = [];
  @State resultList: SearchResult[] = [];
  @State showResult: boolean = false;

  aboutToAppear() {
    const context = getContext(this) as common.UIAbilityContext;
    this.db = new SearchDB(context);
    this.initPage();
  }

  async initPage() {
    await this.db?.initDB();
    this.historyList = await this.db?.queryAllHistory() || [];
  }

  // 执行搜索：保存历史 -> 查询本地结果 -> 刷新历史（去重置顶由数据库保证）
  async handleSearch() {
    if (!this.searchKeyword.trim()) return;
    await this.db?.saveSearchHistory(this.searchKeyword.trim());
    this.resultList = await this.db?.searchLocalData(this.searchKeyword.trim()) || [];
    this.historyList = await this.db?.queryAllHistory() || [];
    this.showResult = true;
  }

  // 清空全部搜索历史（数据库 + 页面）
  clearAllHistory() {
    this.db?.clearAllHistory();
    this.historyList = [];
  }

  // 弹窗确认后清空搜索历史
  showClearDialog() {
    AlertDialog.show({
      title: '清空搜索历史',
      message: '确定要清空全部搜索历史吗？',
      primaryButton: {
        value: '取消',
        action: () => {}
      },
      secondaryButton: {
        value: '清空',
        fontColor: 0xFFFF3B30,
        action: () => {
          this.clearAllHistory();
        }
      }
    });
  }

  // 榜单排名颜色：1/2/3 高亮红，4-10 普通灰
  getRankColor(rank: number): number {
    return rank <= 3 ? 0xFFFF3B30 : 0xFF999999;
  }

  // 榜单区域：横向滚动三张卡片，每张竖向展示 10 条排行
  @Builder
  RankSection() {
    Scroll() {
      Row() {
        ForEach(RANK_BOARDS, (board: RankBoard, index: number) => {
          Column() {
            Text(board.title)
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
              .fontColor(0xFF333333)
              .width('100%')
              .margin({ bottom: 8 })
            ForEach(board.items, (item: HotRankItem) => {
              Row() {
                Text(`${item.rank}`)
                  .fontSize(13)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(this.getRankColor(item.rank))
                  .width(20)
                Text(item.keyword)
                  .fontSize(13)
                  .fontColor(0xFF333333)
                  .layoutWeight(1)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }
              .width('100%')
              .height(26)
              .alignItems(VerticalAlign.Center)
            })
          }
          .width(130)
          .padding(12)
          .backgroundColor(0xFFF7F8FA)
          .borderRadius(8)
          .margin({ right: index === RANK_BOARDS.length - 1 ? 12 : 10 })
          .alignItems(HorizontalAlign.Start)
        })
      }
      .padding({ left: 12 })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
    .margin({ top: 12 })
  }

  // 搜索历史模块（右上角垃圾桶清空，条目点击可直接搜索）
  @Builder
  HistorySection() {
    Column() {
      Row() {
        Text('搜索历史')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.sc'))
          .width(18)
          .height(18)
          .onClick(() => this.showClearDialog())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 12 })

      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.historyList, (item: SearchHistoryItem) => {
          Text(item.keyword)
            .fontSize(13)
            .fontColor(0xFF333333)
            .backgroundColor(0xFFF5F5F5)
            .borderRadius(16)
            .padding({ left: 14, right: 14, top: 7, bottom: 7 })
            .margin({ right: 10, bottom: 10 })
            .onClick(() => {
              this.searchKeyword = item.keyword;
              this.handleSearch();
            })
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding({ left: 12, right: 12 })
    .margin({ top: 20 })
    .alignItems(HorizontalAlign.Start)
  }

  // 猜你想搜模块
  @Builder
  GuessSection() {
    Column() {
      Text('猜你想搜')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .margin({ bottom: 12 })
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(GUESS_WORDS, (word: string) => {
          Text(word)
            .fontSize(13)
            .fontColor(0xFF333333)
            .backgroundColor(0xFFF5F5F5)
            .borderRadius(16)
            .padding({ left: 14, right: 14, top: 7, bottom: 7 })
            .margin({ right: 10, bottom: 10 })
            .onClick(() => {
              this.searchKeyword = word;
              this.handleSearch();
            })
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding({ left: 12, right: 12 })
    .margin({ top: 20 })
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column() {
      Row() {
        // 替换为系统返回图标
        TextInput({
          text: this.searchKeyword,
          placeholder: '请输入搜索内容'
        })
          .layoutWeight(1)
          .height(40)
          .margin({ left: 8, right: 10 })
          .onChange((value: string) => {
            this.searchKeyword = value;
            if (!value.trim()) this.showResult = false;
          })
          .onSubmit(() => this.handleSearch())

        Text('取消')
          .fontSize(18)
          .onClick(() => {
            // 1. 执行点击缩放动画（同时完成跳转）
            animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
              // 模拟点击缩放效果（可选，也可以不加）
              // 比如 this.imageScale = 0.9;

              // 动画执行的同时，直接进行跳转
              router.pushUrl({
                url: "pages/second"
              });
            });
          })
      }
      .width('100%')
      .padding({ top: 30, left: 12, right: 12 })
      .backgroundColor(Color.White)

      if (!this.showResult) {
        // 默认态：搜索历史 + 猜你想搜 + 榜单
        Scroll() {
          Column() {
            if (this.historyList.length > 0) {
              this.HistorySection()
            }
            this.GuessSection()
            this.RankSection()
          }
          .width('100%')
          .padding({ bottom: 30 })
          .alignItems(HorizontalAlign.Start)
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.Off)
        .layoutWeight(1)
        .width('100%')
        .align(Alignment.Top)
      } else {
        // 搜索态：展示本地搜索结果
        if (this.resultList.length > 0) {
          List({ space: 12 }) {
            ForEach(this.resultList, (item: SearchResult) => {
              ListItem() {
                Text(item.name)
                  .fontSize(14)
                  .padding(12)
                  .width('100%')
                  .backgroundColor(0xF5F5F5)
                  .borderRadius(8)
              }
            })
          }
          .width('100%')
          .layoutWeight(1)
          .padding(12)
        } else {
          Text('暂无匹配结果')
            .fontSize(14)
            .fontColor(Color.Grey)
            .margin({ top: 50 })
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
