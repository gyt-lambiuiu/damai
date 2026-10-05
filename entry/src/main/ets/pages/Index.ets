import { window } from '@kit.ArkUI';
import { BottomTab } from '../components/BottomTab';
import router from '@ohos.router'
import { ORDER_ENTRIES, SERVICE_ITEMS, PROFILE_BANNERS, OrderEntry, ServiceItem } from '../model/ProfileModel';
@Entry
@Component
struct Index {
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
  // 监听滚动偏移的状态变量
  @State scrollX: number = 0
  @State selectIndex:number=4
  build() {
    Stack({alignContent:Alignment.Bottom}){
      //1.主体展示区
      Stack({ alignContent: Alignment.Top }){
        //头部
        Row(){
          Image($r('app.media.sz'))
            .width(20)
            .height(20)
            .margin({right:18,top:25})
          Image($r('app.media.xx'))
            .width(20)
            .height(20)
            .margin({top:25})
        }
        .justifyContent(FlexAlign.End)
        .padding({right:15})
        .width('100%')
        .height(60)
        .linearGradient({
          direction:
            GradientDirection.Top,
          colors:[
            [0xFFE6D9,0.0],
            [0xFFD9E6,1.0]
          ]
        })
        .zIndex(666)
        //主体页面
        Scroll(){
          Column(){
            Column(){
              //个人信息
              Row(){
                Image($r('app.media.tx'))
                  .width(70)
                  .borderRadius(35)
                  .margin({right:10})
                  .layoutWeight(1)
                  .onClick(()=>{
                    // 1. 执行点击缩放动画（同时完成跳转）
                    animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
                      // 模拟点击缩放效果（可选，也可以不加）
                      // 比如 this.imageScale = 0.9;

                      // 动画执行的同时，直接进行跳转
                      router.pushUrl({
                        url:"pages/Login"
                      });
                    });
                  })

                Column(){
                  //用户名
                  Text('麦子7bGL5')
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .lineHeight(30)
                  //VIP会员标签
                  Row(){
                    Text('大麦VIP')
                      .fontSize(12)
                      .fontColor('#FFF9F3D8')
                      .fontWeight(FontWeight.Bold)
                      .linearGradient({
                        direction:
                        GradientDirection.Right,
                        colors:[
                          ['#FFD48048',0.0],
                          ['#995533',1.0]
                        ]
                      })
                      .padding({top:3,bottom:3,left:4,right:4})
                      .borderRadius({topLeft:5,bottomLeft:5,bottomRight:5})
                    Text('会员')
                      .fontSize(12)
                      .fontWeight(FontWeight.Bolder)
                      .linearGradient({
                        direction:
                        GradientDirection.Right,
                        colors:[
                          ['#FFF9D0',0.0],
                          ['#FFD290',0.6],
                          ['#D99050',1.0]
                        ]
                      })
                      .padding(3)
                      .margin({left:0.5})
                      .borderRadius({topLeft:5,topRight:5,bottomRight:5})
                  }
                  //关注粉丝获赞
                  Row(){
                    Text('0')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(12)
                    Text('关注')
                      .fontSize(12)
                      .fontColor('#999')
                      .margin({right:10})
                      .padding({right:10})
                      .border({
                        width:{right:0.5},
                        color:'#9999'
                      })
                    Text('0')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(12)
                    Text('粉丝')
                      .fontSize(12)
                      .fontColor('#999')
                      .margin({right:10})
                      .padding({right:10})
                      .border({
                        width:{right:0.5},
                        color:'#9999'
                      })
                    Text('0')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(12)
                    Text('获赞与想看')
                      .fontSize(12)
                      .fontColor('#999')
                  }
                  .margin({top:5})
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(4)
              }
              .padding(20)
              //会员
              Row(){
                Column(){
                  Row(){
                    Row(){
                      Text('大麦VIP会员')
                        .fontSize(15)
                        .fontWeight(FontWeight.Bolder)
                        .fontColor('#FF804F30')
                      Text('·会员中心')
                        .fontSize(13)
                        .fontWeight(FontWeight.Bolder)
                        .fontColor('#FF804F30')
                    }
                    .margin({left:10})
                    Column(){
                      Row(){
                        Text('全部权益')
                          .fontSize(10)
                          .margin({right:3})
                          .fontColor('#FF804F30')
                          .fontWeight(FontWeight.Bold)
                        Image($r('app.media.yjt'))
                          .fillColor('#FF804F30')
                          .width(10)
                      }
                      .margin({right:10})
                    }
                  }
                  .justifyContent(FlexAlign.SpaceBetween)
                  .width('100%')
                  .padding({top:10})
                  Row(){
                    Image($r('app.media.zsg'))
                      .width(40)
                      .margin(10)
                    Column(){
                      Text('你的会员有效期至2026.12.31')
                        .fontSize(13)
                        .fontWeight(FontWeight.Bold)
                        .fontColor('#FF804F30')
                        .margin({bottom:5})
                      Text('可享受演出优先购、免费票等权益')
                        .fontSize(11)
                        .fontColor('#FF804F30')
                    }
                    .alignItems(HorizontalAlign.Start)
                    Text('去看看')
                      .backgroundColor('#FFF9F3D8')
                      .fontSize(10)
                      .fontWeight(FontWeight.Bolder)
                      .fontColor('#FF804F30')
                      .padding({top:1,left:9})
                      .width(50)
                      .height(20)
                      .borderRadius(10)
                      .margin({left:25})
                  }
                  .width('100%')
                }
              }
              .width('95%')
              .borderRadius({topLeft:8,topRight:8})
              .linearGradient({
                direction:
                GradientDirection.Right,
                colors:[
                  ['#FFF5E4B4',0.0],
                  ['#FFE6BB8F',0.43],
                  ['#FFD9A066',0.76],
                  ['#FFC48855',1.0]
                ]
              })
            }
            .width('100%')
            .linearGradient({
              direction:
              GradientDirection.Bottom,
              colors:[
                [0xFFE6D9,0.0],
                ['#FFFCE3D0',0.45],
                ['#FFFDF2E0',0.85],
                ['#FF8F8F8FA',1.0]
              ]
            })
            Row(){
              ForEach(ORDER_ENTRIES, (entry: OrderEntry) => {
                Column(){
                  Image(entry.icon)
                    .width(25)
                    .height(25)
                    .margin({bottom:5,top:15})
                  Text(entry.name)
                    .fontSize(11)
                }
                .layoutWeight(1)
                .onClick(() => {
                  const path: string | undefined = entry.pagePath;
                  if (path) {
                    // 仅带跳转路径的入口执行跳转
                    animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
                      router.pushUrl({ url: path });
                    });
                  }
                })
              })
            }
            .width('95%')
            .height(70)
            .borderRadius({bottomLeft:8,bottomRight:8})
            .backgroundColor(Color.White)
            .margin({bottom:10})
            Row() {
              Row() {
                Row(){
                  Text('3')
                    .fontSize(17)
                    .margin({right:3})
                    .fontWeight(FontWeight.Bold)
                  Text('想看')
                    .fontSize(11)
                    .fontWeight(FontWeight.Bold)
                }
                Row(){
                  Image($r('app.media.yjt'))
                    .fillColor(Color.Gray)
                    .width(12)
                }
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              .padding(10)
              .layoutWeight(1)
              Text('|')
                .fontSize(20)
                .fontColor('#F5F5F5')

              Row() {
                Row(){
                  Text('1')
                    .fontSize(17)
                    .margin({right:3})
                    .fontWeight(FontWeight.Bold)
                  Text('抢票预约')
                    .fontSize(11)
                    .fontWeight(FontWeight.Bold)
                }
                Row(){
                  Text('1今日抢')
                    .fontSize(8)
                    .fontColor(Color.Gray)
                  Image($r('app.media.yjt'))
                    .fillColor(Color.Gray)
                    .width(12)
                }
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              .padding(12)
              .layoutWeight(1)
            }
            .width('95%')
            .height(40)
            .borderRadius(8)
            .backgroundColor(Color.White)
            Column() {
              Scroll() {
                Row() {
                  ForEach(SERVICE_ITEMS, (item: ServiceItem) => {
                    Column() {
                      Image(item.icon)
                        .width(25)
                        .height(25)
                        .margin({ bottom: 10 })
                      Text(item.name)
                        .fontSize(11)
                    }
                    .width('25%')
                  })
                }
                .margin({top:13})
                .backgroundColor(Color.White)
                .justifyContent(FlexAlign.SpaceAround)
              }
              .scrollable(ScrollDirection.Horizontal)
              .scrollBar(BarState.Off)
              // 监听滚动偏移
              .onScroll((x: number, _y: number) => {
                this.scrollX = x
              })

              // 2. 自定义滑动条指示器（和截图一模一样）
              Stack() {
                // 灰色背景条
                Row()
                  .width(20)
                  .height(3)
                  .backgroundColor('#E5E5E5')
                  .borderRadius(2)

                // 橙色滑块条（跟随滚动）
                Row()
                  .width(10)
                  .height(3)
                  .backgroundColor('#FF6700')
                  .borderRadius(2)
                  // 跟随 Scroll 偏移移动（除以8是调节灵敏度，可微调）
                  .translate({ x: this.scrollX / 6 })
              }
              .margin({top:8})
              .width('90%')
              .alignContent(Alignment.Center) // 指示器居中
            }
            .height(80)
            .borderRadius(8)
            .backgroundColor(Color.White)
            .margin({ top: 10, bottom: 10 })
            .width('95%')

            //轮播图
            Swiper(){
              ForEach(PROFILE_BANNERS, (img: ResourceStr) => {
                Image(img)
              })
            }
            .width('95%')
            .aspectRatio(3.8)
            .borderRadius(8)
            .loop(true)
            .autoPlay(true)
            .interval(5000)
            .indicator(
              Indicator.dot()
                .color(Color.Gray)
                .itemWidth(10)
                .itemHeight(4)
                .selectedItemWidth(10)
                .selectedItemHeight(4)
                .selectedColor(Color.White)
            )
             //动态
            Row(){
              Text('动态')
                .lineHeight(13)
                .margin({top:18,bottom:18,left:10})
                .fontWeight(FontWeight.Bolder)
                .width('90%')
            }
            Row(){
              //左侧
              Row(){
                  Row(){
                    Image($r('app.media.qpj'))
                      .width(50)
                      .height('70%')
                  }
                  Column(){
                    Text('2条待评价')
                      .fontSize(13)
                      .fontWeight(FontWeight.Bold)
                    Row(){
                      Text('去评价')
                        .fontSize(10)
                        .lineHeight(15)
                        .fontColor(Color.Gray)

                      Image($r('app.media.yjt'))
                        .width(10)
                        .height(10)
                        .fillColor(Color.Gray)

                    }
                  }
                  .alignItems(HorizontalAlign.Start)
              }
              .width('49%')
              .height(50)
              .backgroundColor(Color.White)
              .margin({right:10})
              .borderRadius(8)
              //右侧
              Row(){
                Column(){
                  Text('0元观看好演出')
                    .fontSize(13)
                    .fontWeight(FontWeight.Bold)
                  Row(){
                    Text('观演团活动招募中')
                      .fontSize(10)
                      .lineHeight(15)
                      .fontColor(Color.Gray)

                    Image($r('app.media.yjt'))
                      .width(10)
                      .height(10)
                      .fillColor(Color.Gray)

                  }
                }
                .margin({left:10})
                .alignItems(HorizontalAlign.Start)

              }
              .width('48%')
              .height(50)
              .backgroundColor(Color.White)
              .borderRadius(8)

            }
            .margin({bottom:15})
            .width('95%')

            //小人
            Image($r('app.media.gsg'))
              .height(300)

          }
          .margin({top:60,bottom:60})
        }
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      // 引入封装好的底部导航
      BottomTab({ selectIndex: $selectIndex })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF7F7F9')
    .expandSafeArea([SafeAreaType.SYSTEM])
    .borderRadius(10)
  }
}