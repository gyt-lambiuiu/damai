import { window } from '@kit.ArkUI';
import router from '@ohos.router';
import { ORDER_TABS, ORDER_FILTERS, OrderTab } from '../model/OrderModel';
@Entry
@Component

struct second {
  // 控制导航选中状态
  @State selectIndex: number = 0;
  // 在页面即将出现时设置全屏和隐藏系统导航栏
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
  build(){
    Stack({alignContent:Alignment.Bottom}){
      //1.主体展示区
      Stack({ alignContent: Alignment.Top }){
      //头部
        Column(){
          Row(){
            Row(){
              Image($r('app.media.zjtg'))
                .width(15)
                .height(15)
                .fillColor(Color.Black)
            }
            .width(50)
            .margin({top:38})
            .padding({left:20})
            .onClick(()=>{
              // 1. 执行点击缩放动画（同时完成跳转）
              animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
                // 模拟点击缩放效果（可选，也可以不加）
                // 比如 this.imageScale = 0.9;

                // 动画执行的同时，直接进行跳转
                console.log('点到了')
                router.pushUrl({
                  url:"pages/Index"
                });
              });
            })

            Text('我的订单')
              .fontSize(17)
              .fontWeight(FontWeight.Medium)
              .margin({left:100,top:38})
          }
          .width('100%')
          .height(90)
          .backgroundColor(Color.White)
          Row(){
            Scroll(){
              Row(){
                ForEach(ORDER_TABS, (tab: OrderTab) => {
                  Text(tab.name)
                    .fontWeight(FontWeight.Bold)
                    .fontSize(tab.active ? 18 : 17)
                    .padding({top:7,bottom:7,left:12,right:12})
                    .borderRadius(10)
                    .margin({left: tab.active ? 0 : 5})
                    .fontColor(tab.active ? Color.Black : Color.Gray)
                })
              }
              .padding({left:10})
            }
            .scrollable(ScrollDirection.Horizontal)
            .scrollBar(BarState.Off)
          }
          .width('100%')
          .height(50)
          .backgroundColor(Color.White)
          Row(){
            ForEach(ORDER_FILTERS, (name: string, index: number) => {
              Text(name)
                .fontColor(index === 0 ? 0xFFFF5F00 : Color.Black)
                .padding({top:7,bottom:7,left:12,right:12})
                .borderRadius(10)
                .backgroundColor(index === 0 ? 0xFFFFE2C8 : Color.White)
                .margin({left: index === 0 ? 0 : 5})
            })
          }
          .width('100%')
          .padding({left:10,top:12})
          Column(){
            Image($r('app.media.ss'))
              .width(170)
              .height(170)
              .margin({top:100})
            Text('您暂时没有订单哟~')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
          }
        }

      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF7F7F9')
    .expandSafeArea([SafeAreaType.SYSTEM])
    .borderRadius(10)
  }
}
