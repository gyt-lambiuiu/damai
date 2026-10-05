/**
 * gp.ets —— 演唱会预约页面（纯 UI 复刻）
 *
 * 页面结构（自上而下）：
 *   1. 顶部导航栏：返回箭头 + 大标题
 *   2. 顶部 banner：两行大黑体文案 + 右上角卡通小人
 *   3. 主体白色区域：预约想看场次（选中态卡片）+ 预约想看票档（4 个票档卡片）
 *   4. 底部渐变橙色大按钮：提交抢票预约
 *
 * 说明：
 *   - 本页面只做静态展示，不包含真实业务逻辑（返回 / 爱心 / 提交均无点击事件）
 *   - 图片资源均已放入 entry/src/main/resources/base/media/ 目录：
 *       返回箭头  -> zjtg.svg
 *       卡通小人  -> ic_mascot.svg
 *       实心爱心  -> ic_heart_fill.svg
 *       空心爱心  -> ic_heart_line.svg
 */
import router from '@ohos.router';
import { window } from '@kit.ArkUI';
// 票档数据模型
interface TicketLevel {
  id: number
  name: string
}

// 票档列表（静态数据，渲染时用 ForEach 遍历）
const TICKET_LEVELS: TicketLevel[] = [
  { id: 1, name: '看台399元' },
  { id: 2, name: '看台599元' },
  { id: 3, name: '看台799元' },
  { id: 4, name: '看台999元' },
]

// 顶部背景（浅米橙渐变，基于 0xFFFFF1E8）
const TOP_BG_COLORS: [string, number][] = [['#FFF8F1', 0], ['#FFEBDC', 1]]
// 底部按钮（黄 -> 荧光橙渐变）
const BTN_BG_COLORS: [string, number][] = [['#FFE260', 0], ['#FF7D00', 1]]

@Entry
@Component
struct ReservePage {
  // 当前选中的票档 id（0 表示未选中任何票档）
  @State selectedLevelId: number = 0
  aboutToAppear() {
    this.hideSystemNavigationBar();
  }

  async hideSystemNavigationBar() {
    try {
      const win = await window.getLastWindow(getContext(this));
      // 隐藏状态栏和导航栏（虚拟按键区）
      win.setWindowSystemBarEnable([]); // 传入空数组表示什么都不显示
      // 可选：设置为全屏布局（内容延伸到状态栏和导航栏区域）
      win.setWindowLayoutFullScreen(true);
    } catch (err) {
      console.error('隐藏系统导航栏失败：' + JSON.stringify(err));
    }
  }

  build() {
    Column() {
      // ========== 顶部导航栏 ==========
      Row() {
        // 返回箭头
        Image($r('app.media.zjtg'))
          .width(22)
          .height(22)
          .fillColor('#000000')
          .onClick(() => {
            // 1. 执行点击缩放动画（同时完成跳转）
            animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
              // 模拟点击缩放效果（可选，也可以不加）
              // 比如 this.imageScale = 0.9;

              // 动画执行的同时，直接进行跳转
              console.log('点到了')
              router.pushUrl({
                url: "pages/third"
              });
            });
          })
        // 中间大标题
        Text('广州·陈粒「一粒」十周年巡回演唱会-广州站')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1F1F1F')
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ left: 10 })
          .layoutWeight(1)
      }
      .width('100%')
      .height(52)
      .margin({top:20})
      .padding({ left: 16, right: 16 })
      .alignItems(VerticalAlign.Center)

      // ========== 顶部 banner 区域 ==========
      Row() {
        // 左侧两行大黑体文案
        Column({ space: 6 }) {
          Text('提前预约想看的场次和票档')
            .fontSize(17)
            .fontWeight(FontWeight.Bolder)
            .fontColor('#1A1A1A')
          Text('购票快人一步')
            .fontSize(22)
            .fontWeight(FontWeight.Bolder)
            .fontColor('#1A1A1A')
        }
        .alignItems(HorizontalAlign.Start)

        Blank()

        // 右上角卡通小人（占位，后续替换资源）
        Image($r('app.media.ic_mascot'))
          .width(88)
          .height(88)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 6, bottom: 18 })
      .alignItems(VerticalAlign.Center)

      // ========== 主体白色区域（圆角上沿） ==========
      Column() {
        Scroll() {
          Column() {
            // ---- 第一块：预约想看场次 ----
            Row() {
              Text('预约想看场次')
                .fontSize(17)
                .fontWeight(FontWeight.Bold)
                .fontColor('#1A1A1A')
              Text('场次时间均为演出当地时间')
                .fontSize(12)
                .fontColor('#9A9A9A')
                .margin({left:5})
            }
            .width('100%')
            .margin({ bottom: 12 })

            // 选中态场次卡片（橙色边框）
            Row() {
              Text('2026-10-17 周六19:00')
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor('#1A1A1A')
                .layoutWeight(1)
              // 「可预约」小标签
              Text('可预约')
                .fontSize(11)
                .fontColor('#FF7D00')
                .backgroundColor('#FFE8D5')
                .borderRadius(4)
                .padding({ left: 8, right: 8, top: 2, bottom: 2 })
              // 实心红色爱心
              Image($r('app.media.ic_heart_fill'))
                .width(20)
                .height(20)
                .margin({ left: 10 })
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .padding({ left: 14, right: 14, top: 14, bottom: 14 })
            .borderRadius(10)
            .border({ width: 1.5, color: '#FF7D00' })
            .backgroundColor('#FFF7F2')

            // ---- 第二块：预约想看票档 ----
            Text('预约想看票档')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor('#1A1A1A')
              .margin({ top: 26, bottom: 12 })

            // 票档卡片列表（ForEach 遍历，点击选中后高亮）
            ForEach(TICKET_LEVELS, (item: TicketLevel) => {
              Row() {
                Text(item.name)
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#1A1A1A')
                  .layoutWeight(1)
                // 「可预约」小标签
                Text('可预约')
                  .fontSize(11)
                  .fontColor('#FF7D00')
                  .backgroundColor('#FFE8D5')
                  .borderRadius(4)
                  .padding({ left: 8, right: 8, top: 2, bottom: 2 })
                if (this.selectedLevelId === item.id) {
                  // 选中：实心红色爱心
                  Image($r('app.media.ic_heart_fill'))
                    .width(20)
                    .height(20)
                    .margin({ left: 10 })
                } else {
                  // 未选中：空心爱心
                  Image($r('app.media.ic_heart_line'))
                    .width(20)
                    .height(20)
                    .margin({ left: 10 })
                }
              }
              .width('100%')
              .padding({ left: 14, right: 14, top: 14, bottom: 14 })
              .borderRadius(10)
              // 选中态：橙色边框 + 浅橙底；未选中：灰色细边框 + 浅灰底
              .border(this.selectedLevelId === item.id
                ? { width: 1.5, color: '#FF7D00' }
                : { width: 1, color: '#E8E8E8' })
              .backgroundColor(this.selectedLevelId === item.id ? '#FFF7F2' : '#F7F7F7')
              .margin({ bottom: 10 })
              .onClick(() => {
                // 点击已选中的票档则取消选中，否则切换选中
                this.selectedLevelId = this.selectedLevelId === item.id ? 0 : item.id
              })
            }, (item: TicketLevel) => item.id.toString())
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 20, bottom: 20 })
        }
        .layoutWeight(1)
        .align(Alignment.Top)
        .scrollBar(BarState.Off)

        // ========== 底部渐变橙色大按钮 ==========
        Column() {
          Text('提交抢票预约')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
          Text('开抢后有票会自动为你勾选')
            .fontSize(12)
            .fontColor('#FFFFFF')
            .opacity(0.92)
            .margin({ top: 4 })
        }
        .width(320)
        .height(52)
        .justifyContent(FlexAlign.Center)
        .borderRadius(10)
        .linearGradient({ angle: 90, colors: BTN_BG_COLORS })
        // 未选中票档时整体压暗（保持橙色渐变，仅降低亮度），选中后恢复高亮
        .brightness(this.selectedLevelId === 0 ? 0.78 : 1)
        .margin({ left: 16, right: 16, top: 8, bottom: 16 })
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#FFFFFF')
      .borderRadius({ topLeft: 20, topRight: 20 })
    }
    .width('100%')
    .height('100%')
    .linearGradient({ angle: 180, colors: TOP_BG_COLORS })
  }
}
