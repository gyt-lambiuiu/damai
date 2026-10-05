import { window } from '@kit.ArkUI';
import { BottomTab } from '../components/BottomTab';
import router from '@ohos.router';

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
        Row(){
          Text('证照信息')
            .fontSize(8)
            .fontColor(0xFFE5E5E5)
            .width(20)
            .height(20)
            .backgroundColor(0x1AEEEEEE)
            .margin({right:6,top:35})
          Text('福州')
            .fontColor('#FFF7F7F9')
            .fontSize(15)
            .margin({top:35})
          Image($r('app.media.xjt'))
            .width(10)
            .height(10)
            .margin({left:3,right:10,top:35})
            .fillColor(Color.White)
          Row(){
            Row(){
              Image($r('app.media.sm'))
                .width(18)
                .height(18)
                .fillColor(Color.Pink)
                .margin(8)

              Text('|')
                .fontColor(Color.Pink)
                .fontSize(18)
                .fontWeight(FontWeight.Lighter)
                .margin({right:8})
              Text('龙梅子')
                .fontColor(0xFFD0D0D0)
                .fontSize(13)
              Text('搜索')
                .fontSize(12)
                .fontColor(Color.White)
                .width(45)
                .height(22)
                .padding({left:11,top:2})
                .borderRadius(10)
                .backgroundColor(0xFFF09EB7)
                .margin({left:97})
            }
            .onClick(()=>{
              // 1. 执行点击缩放动画（同时完成跳转）
              animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
                // 模拟点击缩放效果（可选，也可以不加）
                // 比如 this.imageScale = 0.9;

                // 动画执行的同时，直接进行跳转
                router.pushUrl({
                  url:"pages/SearchPage"
                });
              });
            })
          }
          .margin({top:35})
          .height(28)
          .width(230)
          .backgroundColor(Color.White)
          .borderRadius({topRight:14,bottomRight:14,topLeft:14})

          Image($r('app.media.gd'))
            .width(24)
            .height(24)
            .margin({left:14,top:35})
            .fillColor(Color.White)
        }
        .justifyContent(FlexAlign.Start)
        .padding({right:15})
        .width('100%')
        .height(80)
        .linearGradient({
          direction:
          GradientDirection.Right,
          colors:[
            [0xFFF09EB7,0.0],
            [0xFFF8C8D8,0.35],
            [0xFFFFE8D6,0.75],
            [0xFFFFF1E6,1.0]
          ]
        })
        .zIndex(666)
        //滚动区域
        Scroll(){
          Column(){
            //我的抢票预约
            Column(){
              Column() {

              }
              .width('100%')
              .height(65) // 渐变条高度，可根据设计调整
              .linearGradient({
                direction: GradientDirection.Right, // 从左到右渐变
                colors:[
                  [0xFFF09EB7,0.0],
                  [0xFFF8C8D8,0.35],
                  [0xFFFFE8D6,0.75],
                  [0xFFFFF1E6,1.0]
                ]
              })
              Column(){
                Column(){
                  //我的抢票预约
                  Row() {
                    Image($r('app.media.qpyyg'))
                      .width(100)
                      .height(30)
                      .margin({right:5})
                    Text('今日抢票 一键直达')
                      .fontSize(10)
                      .fontColor(Color.Gray)
                  }
                  .width('100%')
                  .margin({left:20,top:3})
                  //邓紫棋
                  Row(){
                    Column(){
                      Stack(){
                        Stack(){
                          Stack() {
                            Stack() {
                              Image($r('app.media.dzq'))
                                .width(40)
                                .height(40)
                                .borderRadius(20)
                            }
                            .width(42)
                            .height(42)
                            .backgroundColor(Color.White)
                            .borderRadius(21)
                          }
                          .width(44)
                          .height(44)
                          .backgroundColor(0xFFFFC107)
                          .borderRadius(22)
                        }
                        .width(46)
                        .height(46)
                        .backgroundColor('#FFF7F7F9')
                        .borderRadius(23)
                      }
                      .width(48)
                      .height(48)
                      .backgroundColor(0xFF999999)
                      .borderRadius(24)
                      Text('邓紫棋')
                        .fontSize(8)
                        .fontWeight(FontWeight.Bolder)
                        .margin({ top: -10})
                        .backgroundColor(0xFFFFC107)
                        .padding(1)
                        .height(10)
                        .borderRadius(5)
                    }
                    Column(){
                      Text('【福州】G.E.M.邓紫棋 | AM GLORIA世界巡回演唱会2.0 - 福州站')
                        .fontSize(11)
                        .maxLines(2)
                        .fontWeight(FontWeight.Bold)
                        .textOverflow({
                          overflow:TextOverflow.Ellipsis
                        })
                        .width('82%')
                        .margin({left:2,bottom:5})
                      Row(){
                        Text('￥460')
                          .fontSize(11)
                          .fontWeight(FontWeight.Bold)
                          .margin({left:2,top:5})
                        Text('×')
                          .fontSize(11)
                          .fontColor(0xFFD0D0D0)
                          .margin({left:5,top:5})
                        Text('1')
                          .fontSize(11)
                          .fontWeight(FontWeight.Bold)
                          .margin({left:5,top:5})
                        Text('张')
                          .fontSize(10)
                          .margin({top:5})
                        Image($r('app.media.zbqp'))
                          .width(80)
                          .height(40)
                          .position({
                            x:180,
                            y:-15
                          })
                          .onClick(()=>{
                            // 1. 执行点击缩放动画（同时完成跳转）
                            animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
                              // 模拟点击缩放效果（可选，也可以不加）
                              // 比如 this.imageScale = 0.9;

                              // 动画执行的同时，直接进行跳转
                              router.pushUrl({
                                url:"pages/third"
                              });
                            });
                          })
                      }

                    }
                    .width('100%')
                    .alignItems(HorizontalAlign.Start)
                  }
                  .margin({left:25,top:5})
                  .width('100%')
                }

              }
              .width('95%') // 白色卡片宽度，居中显示
              .height(95)
              .backgroundColor(Color.White)
              .borderRadius(8)
              .margin({ top: -60}) // 向上偏移，覆盖部分渐变条，形成融合效果

            }
            .width('100%')
            .height('auto')
            .backgroundColor(0xFFF5F5F5) // 页面背景色
            .margin({bottom:10})
            //小图标
            Column(){
              Grid() {
                ForEach([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19], (index: number) => {
                  GridItem() {
                    // 根据 index 返回不同的图标内容
                    if (index === 0) {
                      Column() {
                        Image($r('app.media.ych')).width(33).height(33).margin({ bottom: 5 })
                        Text('演唱会').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 1) {
                      Column() {
                        Image($r('app.media.yyj')).width(35).height(35).margin({ bottom: 5 ,left:5})
                        Text('音乐节').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 2) {
                      Column() {
                        Image($r('app.media.hj')).width(33).height(33).margin({ bottom: 5 })
                        Text('话剧音乐剧').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 3) {
                      Column() {
                        Image($r('app.media.live')).width(33).height(33).margin({ bottom: 7 })
                        Text('Livehouse').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 4) {
                      Column() {
                        Image($r('app.media.dy')).width(35).height(35).margin({ bottom: 4 })
                        Text('电影').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 5) {
                      Column() {
                        Image($r('app.media.wdwj')).width(33).height(33).margin({ bottom: 7 })
                        Text('舞蹈舞剧').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 6) {
                      Column() {
                        Image($r('app.media.jd')).width(33).height(33).margin({ bottom: 5 })
                        Text('景点乐园').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 7) {
                      Column() {
                        Image($r('app.media.xj')).width(50).height(50).margin({ bottom: -3 ,left:19})
                        Text('喜剧脱口秀').fontSize(11).fontWeight(FontWeight.Medium)
                      }
                    } else if (index === 8) {
                      Column() {
                        Image($r('app.media.ty')).width(40).height(40).margin({ bottom: 2,top:-5,left:3 })
                        Text('体育').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 9) {
                      Column() {
                        Image($r('app.media.xsqy')).width(33).height(33).margin({ bottom: 5 })
                        Text('相声曲艺').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 10) {
                      Column() {
                        Image($r('app.media.cjsyc')).width(33).height(33).margin({ bottom: 5 ,left:5})
                        Text('沉浸式演出').fontSize(11).margin({left:9}).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 11) {
                      Column() {
                        Image($r('app.media.qqyc')).width(33).height(33).margin({ bottom: 5 ,left:19})
                        Text('全球演出').fontSize(11).margin({left:15}).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 12) {
                      Column() {
                        Image($r('app.media.zl')).width(33).height(33).margin({ bottom: 5,left:4 })
                        Text('展览').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 13) {
                      Column() {
                        Image($r('app.media.dmbd')).width(33).height(33).margin({ bottom: 5 })
                        Text('大麦榜单').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 14) {
                      Column() {
                        Image($r('app.media.yyh')).width(33).height(33).margin({ bottom: 5,left:4})
                        Text('音乐会').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 15) {
                      Column() {
                        Image($r('app.media.xchl')).width(33).height(33).margin({ bottom: 5 })
                        Text('现场壕礼').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 16) {
                      Column() {
                        Image($r('app.media.etqz')).width(33).height(33).margin({ bottom: 5 })
                        Text('儿童亲子').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 17) {
                      Column() {
                        Image($r('app.media.zbsc')).width(33).height(33).margin({ bottom: 5 })
                        Text('周边商城').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else if (index === 18) {
                      Column() {
                        Image($r('app.media.ycrl')).width(33).height(33).margin({ bottom: 5 })
                        Text('演出日历').fontSize(11).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    } else {
                      // index === 19
                      Column() {
                        Image($r('app.media.qb')).width(33).height(33).margin({ bottom: 5 ,left:6})
                        Text('全部').fontSize(11).margin({left:3}).fontWeight(FontWeight.Medium)
                      }.padding(10)
                    }
                  }
                })
              }
              .rowsTemplate('1fr 1fr')
              .rowsGap(1)
              .columnsGap(1)   // 建议改为16，避免太挤
              .padding({ left: 1, right: 10 })
              .width('100%')
              .height(130)
              .scrollBar(BarState.Off)


            }
            .width('95%')
            .height(135)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .margin({bottom:10})
            //播报站 天天低价
            Row(){
              //左侧
              Row(){
                Column(){
                  Row(){
                    Text('抢票播报站')
                      .fontSize(13)
                      .fontWeight(FontWeight.Bolder)
                      .margin({left:10,top:-5})
                    Row(){
                      Text('张学友广州')
                        .fontSize(9)
                        .margin({left:8})
                        .fontColor(0xFFF09EB7)

                      Image($r('app.media.yjt'))
                        .width(8)
                        .height(8)
                        .margin({left:3})
                        .fillColor(0xFFF09EB7)
                    }
                    .backgroundColor(Color.White)
                    .width(65)
                    .height(16)
                    .margin({top:-5,left:20})
                    .borderRadius(9)
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.Start)
                  .margin({bottom:12})

                  Row(){
                    Column(){
                      Stack() {
                        Stack() {
                          Image($r('app.media.dzq'))
                            .width(42)
                            .height(42)
                            .borderRadius(21)
                        }
                        .width(44)
                        .height(44)
                        .backgroundColor(Color.White)
                        .borderRadius(22)
                      }
                      .width(46)
                      .height(46)
                      .backgroundColor(0xFFFFC107)
                      .borderRadius(23)
                      .margin({top:-22})
                      Text('邓紫棋')
                        .fontSize(8)
                        .fontWeight(FontWeight.Bolder)
                        .margin({ top: -10})
                        .backgroundColor(0xFFFFC107)
                        .padding(1)
                        .height(10)
                        .borderRadius(5)
                    }
                    .margin({left:15})
                    Column(){
                      Text('G.E.M邓紫棋 | AM')
                        .fontSize(11)
                        .lineHeight(25)
                        .width(120)
                        .fontWeight(FontWeight.Bold)
                      Text('GLOBLA世界巡回演唱会2.0 - 福州站')
                        .fontSize(11)
                        .width(100)
                        .fontWeight(FontWeight.Bold)
                        .maxLines(1)
                        .textOverflow({
                          overflow:TextOverflow.Ellipsis
                        })
                      Row(){
                        Text('39.9')
                          .fontColor(0xFFF09EB7)
                          .fontSize(10)
                          .lineHeight(15)
                          .fontWeight(FontWeight.Bold)
                        Text('万人想看')
                          .fontSize(9)
                          .lineHeight(15)
                          .fontColor(Color.Gray)
                      }
                      Image($r('app.media.q'))
                        .width(80)
                        .height(20)
                        .margin({left:15})
                        .onClick(()=>{
                          // 1. 执行点击缩放动画（同时完成跳转）
                          animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
                            // 模拟点击缩放效果（可选，也可以不加）
                            // 比如 this.imageScale = 0.9;

                            // 动画执行的同时，直接进行跳转
                            router.pushUrl({
                              url:"pages/third"
                            });
                          });
                        })
                    }
                    .margin({left:8,top:-15})
                    .alignItems(HorizontalAlign.Start)
                  }
                  .justifyContent(FlexAlign.Start)
                  .width('100%')
                }

              }
              .width('49%')
              .height(100)
              .linearGradient({
                direction:
                GradientDirection.LeftBottom,
                colors:[
                  [0xfff5dfe8,0.0],
                  [Color.White,0.45],
                  [Color.White,1.0]
                ]
              })
              .margin({right:10})
              .borderRadius(8)
              //右侧
              Row(){
                Column(){
                  Row(){
                    Text('天天低价')
                      .fontSize(13)
                      .fontWeight(FontWeight.Bolder)
                      .margin({left:10,top:-5})
                    Row(){
                      Text('领券购票更优惠')
                        .fontSize(8)
                        .margin({left:10})
                        .fontColor(Color.Gray)

                      Image($r('app.media.yjt'))
                        .width(8)
                        .height(8)
                        .margin({left:4})
                        .fillColor(Color.Gray)
                    }
                    .backgroundColor(Color.White)
                    .width(80)
                    .height(18)
                    .margin({top:-5,left:18})
                    .borderRadius(9)
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.Start)
                  .margin({bottom:12})

                  Row(){
                    Column(){
                      Image($r('app.media.fgjqy'))
                        .width(40)
                        .height('auto')
                        .borderRadius(5)
                      Text('Livehouse')
                        .maxLines(1)
                        .fontColor(Color.White)
                        .fontSize(8)
                        .textOverflow({
                          overflow:TextOverflow.Ellipsis
                        })
                        .width(35)
                        .borderRadius(2)
                        .height(12)
                        .backgroundColor(Color.Black)
                        .position({
                          x:3,
                          y:4
                        })
                      Row(){
                        Text('￥')
                          .fontSize(6)
                          .fontColor(Color.White)
                        Text('99')
                          .fontSize(10)
                          .margin({right:2})
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('起')
                          .fontSize(7)
                          .fontColor(Color.White)
                      }
                      .padding({left:12,right:12})
                      .height(12)
                      .linearGradient({
                        direction:
                        GradientDirection.Right,
                        colors:[
                          [0xffff4da6,0.0],
                          [0xffff9eaf,1.0]
                        ]
                      })
                      .position({
                        x:-5,
                        y:45
                      })
                      .borderRadius(6)

                    }
                    Column(){
                      Image($r('app.media.ly'))
                        .width(40)
                        .height('auto')
                        .borderRadius(5)
                      Text('话剧')
                        .fontColor(Color.White)
                        .fontSize(8)
                        .width(20)
                        .borderRadius(2)
                        .height(12)
                        .backgroundColor(Color.Black)
                        .position({
                          x:17,
                          y:4
                        })
                      Row(){
                        Text('￥')
                          .fontSize(6)
                          .fontColor(Color.White)
                        Text('100')
                          .fontSize(10)
                          .margin({right:2})
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('起')
                          .fontSize(7)
                          .fontColor(Color.White)
                      }
                      .padding({left:10,right:10})
                      .height(12)
                      .linearGradient({
                        direction:
                        GradientDirection.Right,
                        colors:[
                          [0xffff4da6,0.0],
                          [0xffff9eaf,1.0]
                        ]
                      })
                      .position({
                        x:-5,
                        y:45
                      })
                      .borderRadius(6)

                    }
                  }
                  .justifyContent(FlexAlign.SpaceAround)
                  .width('100%')
                }


              }
              .width('49%')
              .height(100)
              .linearGradient({
                direction:
                GradientDirection.LeftBottom,
                colors:[
                  [0xfffff5d9,0.0],
                  [Color.White,0.45],
                  [Color.White,1.0]
                ]
              })
              .margin({right:10})
              .borderRadius(8)

            }
            .margin({bottom:8})
            .width('95%')
            //演出日历 演出榜 团购
            Row(){
              //左侧
              Row(){
                Row(){
                  Column(){
                    Text('演出日历')
                      .fontSize(15)
                      .lineHeight(15)
                      .fontWeight(FontWeight.Bolder)
                      .margin({bottom:8})
                    Text('按时间选演出')
                      .fontColor(Color.Gray)
                      .fontSize(9)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .padding(10)
                  Image($r('app.media.rq'))
                    .width(20)
                    .height(20)
                    .position({
                      x:85,
                      y:30
                    })
                }
              }
              .width('32%')
              .height(55)
              .backgroundColor(Color.White)
              .margin({right:5})
              .borderRadius(8)
              //中间
              Row(){
                Row(){
                  Column(){
                    Text('大麦演出榜')
                      .fontSize(15)
                      .lineHeight(15)
                      .fontWeight(FontWeight.Bolder)
                      .margin({bottom:8})
                    Text('你的观演指南')
                      .fontColor(Color.Gray)
                      .fontSize(9)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .padding(10)
                  Image($r('app.media.top'))
                    .width(20)
                    .height(20)
                    .position({
                      x:85,
                      y:30
                    })
                }
              }
              .width('33%')
              .height(55)
              .backgroundColor(Color.White)
              .margin({right:5})
              .borderRadius(8)
              //右侧
              Stack(){
                Row(){
                  Column(){
                    Text('大麦团购')
                      .fontSize(15 )
                      .lineHeight(15)
                      .fontWeight(FontWeight.Bolder)
                      .margin({bottom:8})
                    Text('超低价随时退')
                      .fontColor(Color.Gray)
                      .fontSize(9)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .padding(10)
                }
                .width('75%')
                .height('96%')
                .backgroundColor(Color.White)
                .borderRadius({topLeft:8,bottomLeft:8})
                .position({
                  x:2,
                  y:1
                })
                Image($r('app.media.jt'))
                  .height(20)
                  .width(20)
                  .position({
                    x:89,
                    y:18
                  })

              }
              .width('33%')
              .height(55)
              .linearGradient({
                direction: GradientDirection.Top,
                colors: [
                  [0xffe03e80, 0], // 起点：深粉色
                  [0xffffb380, 1]  // 终点：暖橙色
                ]
              })
              .borderRadius(8)

            }
            .margin({bottom:10})
            .width('95%')
            //轮播图
            Swiper(){
              Image($r('app.media.1'))
              Image($r('app.media.2'))
              Image($r('app.media.3'))
              Image($r('app.media.4'))
              Image($r('app.media.5'))
            }
            .width('95%')
            .aspectRatio(5.5)
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
            Column() {
              Row(){
                Row(){
                  Text('必看演出')
                    .fontSize(15)
                    .fontWeight(FontWeight.Bold)
                }
                Row(){
                  Text('全部')
                    .fontSize(13)
                    .fontColor(Color.Gray)
                  Image($r('app.media.yjt'))
                    .width(15)
                    .height(15)
                    .fillColor(Color.Gray)
                }
              }
              .padding(10)
              .justifyContent(FlexAlign.SpaceBetween)
              .width('100%')
              Scroll() {
                Column(){
                  Row() {
                    Column(){
                      Image($r('app.media.yc1'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:15})
                      Text('潮流展')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:16,
                          y:-7
                        })
                      Row(){
                        Text('9.1')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:17,
                        y:75
                      })

                      Text('一人之下十周年漫画')
                        .fontSize(12)
                        .margin({left:9,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.yc2'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:6})
                      Text('沉浸式')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:13  ,
                          y:-7
                        })
                      Row(){
                        Text('9.8')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('[年度金奖]高口碑必看')
                        .fontSize(12)
                        .margin({left:2,top:8})

                    }
                    .width('25%')
                    Column(){
                      Image($r('app.media.yc3'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:1})
                      Text('音乐节')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:10,
                          y:-9
                        })

                      Text('2026赤峰北疆音乐节')
                        .fontSize(12)
                        .margin({left:2,top:4})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.yc4'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:1})
                      Text('沉浸式')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:12,
                          y:-7
                        })
                      Row(){
                        Text('9.8')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('一人之下十周年漫画')
                        .fontSize(12)
                        .margin({left:2,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.yc5'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:4})
                      Text('演唱会')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:13,
                          y:-7
                        })

                      Text('EvolutionNicLive谢霆锋')
                        .fontSize(12)
                        .margin({left:8,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.yc6'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:4})
                      Text('脱口秀')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:15,
                          y:-7
                        })
                      Row(){
                        Text('8.5')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:13,
                        y:75
                      })

                      Text('单立人DownTown')
                        .fontSize(12)
                        .margin({left:1,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.yc7'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:4})
                      Text('艺术展')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:13,
                          y:-7
                        })
                      Text('北京当代·艺术博览会')
                        .fontSize(12)
                        .margin({left:10,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.yc8'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:4})
                      Text('演唱会')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:13,
                          y:-7
                        })

                      Text('2026郁可唯"我怪"巡回演唱会')
                        .fontSize(12)
                        .margin({left:6,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.yc9'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-12,left:4})
                      Text('LiveHouse')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(55)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:13,
                          y:-7
                        })
                      Row(){
                        Text('9.9')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('【三里屯工体】吉他弹唱')
                        .fontSize(12)
                        .margin({left:8,top:8})

                    }
                    .width('25%')

                  }
                  .margin({top:13,bottom:10})
                  .backgroundColor(Color.White)
                  .justifyContent(FlexAlign.SpaceAround)
                }
              }
              .scrollable(ScrollDirection.Horizontal)
              .scrollBar(BarState.Off)
              Row(){
                Row(){
                  Text('热映电影')
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                }
                Row(){
                  Text('全部')
                    .fontSize(13)
                    .fontColor(Color.Gray)
                  Image($r('app.media.yjt'))
                    .width(15)
                    .height(15)
                    .fillColor(Color.Gray)
                }
              }
              .border({
                width:{ top:1 },
                color:Color.Gray,
                style:BorderStyle.Dashed
              })
              .padding(10)
              .justifyContent(FlexAlign.SpaceBetween)
              .width('100%')
              Scroll() {
                Column(){
                  Row() {
                    Column(){
                      Image($r('app.media.dy1'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:15})
                      Text('IMAX 2D')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(47)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:16,
                          y:-10
                        })
                      Row(){
                        Text('9.7')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:17,
                        y:75
                      })

                      Text('给阿嬷的情')
                        .fontSize(12)
                        .margin({left:9,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.dy2'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:6})

                      Text('今晚正好')
                        .fontSize(12)
                        .margin({left:2,top:7})

                    }
                    .width('25%')
                    Column(){
                      Image($r('app.media.dy3'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:1})
                      Text('IMAX 2D')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(48)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:10,
                          y:-10
                        })
                      Row(){
                        Text('9.3')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('星球大战：')
                        .fontSize(12)
                        .margin({left:2,top:7})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.dy4'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:1})
                      Text('CINITY')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(35)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:15,
                          y:-10
                        })
                      Row(){
                        Text('8.9')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('消失的人')
                        .fontSize(12)
                        .margin({left:2,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.dy5'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:4})

                      Text('错过了，遗')
                        .fontSize(12)
                        .margin({left:5,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.dy6'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:4})
                      Text('IMAX 2D')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(48)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:15,
                          y:-10
                        })
                      Row(){
                        Text('9.5')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('寒战1994')
                        .fontSize(12)
                        .margin({left:5,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.dy7'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:4})
                      Text('CINITY2D')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(50)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:15,
                          y:-10
                        })
                      Row(){
                        Text('9.3')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('分')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('绵羊侦探团')
                        .fontSize(12)
                        .margin({left:5,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.dy8'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:4})

                      Text('一个男人和')
                        .fontSize(12)
                        .margin({left:5,top:8})

                    }
                    .width('25%')

                    Column(){
                      Image($r('app.media.dy9'))
                        .width(75)
                        .height(110)
                        .borderRadius(8)
                        .margin({top:-13,left:4})
                      Text('IMAX 2D')
                        .fontColor(Color.White)
                        .fontSize(11)
                        .width(48)
                        .borderRadius(4)
                        .height(15)
                        .backgroundColor(Color.Black)
                        .position({
                          x:15,
                          y:-10
                        })
                      Row(){
                        Text('4.1')
                          .fontSize(13)
                          .fontColor(Color.White)
                          .fontWeight(FontWeight.Bolder)
                        Text('万想看')
                          .fontSize(11)
                          .fontColor(Color.White)
                      }
                      .height(12)
                      .position({
                        x:15,
                        y:75
                      })

                      Text('记忆碎片')
                        .fontSize(12)
                        .margin({left:5,top:8})

                    }
                    .width('25%')

                  }
                  .margin({top:13,bottom:10})
                  .backgroundColor(Color.White)
                  .justifyContent(FlexAlign.SpaceAround)
                }
              }
              .scrollable(ScrollDirection.Horizontal)
              .scrollBar(BarState.Off)
            }
            .height(400)
            .borderRadius(8)
            .backgroundColor(Color.White)
            .margin({ top: 10, bottom: 10 })
            .width('95%')
            Column(){
              Row(){
                Scroll(){
                  Row(){
                    Text('推荐')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .backgroundColor('#FFF7F7F9')
                    Text('演唱会')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('音乐节')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('脱口秀')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('Livehouse')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('话剧音乐剧')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('电影')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('体育赛事')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('展览')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('音乐会')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('沉浸式演出')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('儿童亲子')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                    Text('曲苑杂坛')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(17)
                      .padding({top:7,bottom:7,left:12,right:12})
                      .borderRadius(10)
                      .margin({left:5})
                      .backgroundColor('#FFF7F7F9')
                  }
                  .padding({left:10,top:12})
                }
                .scrollable(ScrollDirection.Horizontal)
                .scrollBar(BarState.Off)
              }
              .width('95%')
            }
            .width('100%')
            .height(60)
            .backgroundColor(Color.White)
            .borderRadius({topLeft:8,topRight:8})
            WaterFlow(){
              FlowItem(){
                Column(){
                  Image($r('app.media.pb1'))
                    .width('100%')
                    .height('auto')
                    .borderRadius({topRight:4,topLeft:15})
                    .position({
                      x:0,y:0
                    })
                  Row(){
                    Text('沉浸式')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                    Text('|')
                      .fontSize(10)
                      .fontColor(Color.Gray)
                      .margin({left:5,right:5})
                    Text('9.9')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bolder)
                    Text('分')
                      .fontSize(13)
                      .fontColor(Color.White)
                  }
                  .padding({top:5,bottom:3,left:10,right:10})
                  .backgroundColor(Color.Black)
                  .position({
                    x:0,y:200
                  })
                  Text('北京·喜人狂欢夜《名媛迷案》爆笑解压·沉浸式互动·悬疑推理·约会打卡必看')
                    .fontSize(15)
                    .maxLines(2)
                    .fontWeight(FontWeight.Medium)
                    .lineHeight(23)
                    .padding(6)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                    .position({
                      y:228
                    })
                  Text('本周末开演')
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .position({
                      y:290
                    })
                    .padding({left:6})
                  Row(){
                    Text('￥')
                      .fontSize(15)
                      .fontColor('#F27500')
                    Text('98')
                      .fontSize(22)
                      .fontColor('#F27500')
                      .fontWeight(FontWeight.Bolder)
                    Text('起')
                      .fontSize(14)
                      .fontColor(Color.Gray)
                      .margin({left:4})
                    Text('套票9.4折起')
                      .fontSize(14)
                      .fontColor('#F27500')
                      .margin({left:8})
                  }
                  .padding({left:6})
                  .position({
                    y:315
                  })
                }
                .position({
                  x:0,y:0
                })

              }
              .width('97%')
              .height(350)
              .backgroundColor(Color.White)
              .borderRadius({topRight:4,bottomLeft:4,bottomRight:4,topLeft:15})
              .onClick(()=>{
                // 1. 执行点击缩放动画（同时完成跳转）
                animateTo({ duration: 100, curve: Curve.EaseInOut }, () => {
                  // 模拟点击缩放效果（可选，也可以不加）
                  // 比如 this.imageScale = 0.9;

                  // 动画执行的同时，直接进行跳转
                  router.pushUrl({
                    url:"pages/third"
                  });
                });
              })
              FlowItem(){
                Swiper(){
                  Image($r('app.media.lb1'))
                  Image($r('app.media.lb2'))
                  Image($r('app.media.lb3'))
                }
                .position({
                  x:0,y:0
                })
                .width('100%')
                .height('100%')
                .borderRadius({topRight:15,bottomLeft:4,bottomRight:4,topLeft:4})
                .loop(true)
                .autoPlay(true)
                .interval(10000)
                .indicator(
                  Indicator.dot()
                    .color(Color.Gray)
                    .itemWidth(10)
                    .itemHeight(4)
                    .selectedItemWidth(10)
                    .selectedItemHeight(4)
                    .selectedColor(Color.White)
                )
              }
              .width('95%')
              .margin({left:5})
              .height(230)
              .backgroundColor(Color.White)
              .borderRadius(4)
              .borderRadius({topRight:15,bottomLeft:4,bottomRight:4,topLeft:4})
              FlowItem(){
                Column(){
                  Image($r('app.media.pb2'))
                    .width('100%')
                    .height('auto')
                    .borderRadius({topRight:4,topLeft:4})
                    .position({
                      x:0,y:0
                    })
                  Row(){
                    Text('演唱会')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                    Text('|')
                      .fontSize(10)
                      .fontColor(Color.Gray)
                      .margin({left:5,right:5})
                    Text('8.8')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bolder)
                    Text('万想看')
                      .fontSize(13)
                      .fontColor(Color.White)
                  }
                  .padding({top:5,bottom:3,left:10,right:10})
                  .backgroundColor(Color.Black)
                  .position({
                    x:0,y:205
                  })
                  Text('呼和浩特·周深【深深的】巡回演唱会')
                    .fontSize(15)
                    .maxLines(2)
                    .fontWeight(FontWeight.Medium)
                    .lineHeight(23)
                    .padding(6)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                    .position({
                      y:230
                    })
                  Text('7月11日开演')
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .position({
                      y:290
                    })
                    .padding({left:6})
                  Row(){
                    Text('￥')
                      .fontSize(15)
                      .fontColor('#F27500')
                    Text('399')
                      .fontSize(22)
                      .fontColor('#F27500')
                      .fontWeight(FontWeight.Bolder)
                    Text('起')
                      .fontSize(14)
                      .fontColor(Color.Gray)
                      .margin({left:4})
                  }
                  .padding({left:6})
                  .position({
                    y:315
                  })
                }
                .position({
                  x:0,y:0
                })

              }
              .width('95%')
              .margin({top:10,left:5})
              .height(350)
              .backgroundColor(Color.White)
              .borderRadius(4)
              FlowItem(){
                Column(){
                  Image($r('app.media.pb3'))
                    .width('100%')
                    .height('auto')
                    .borderRadius({topRight:4,topLeft:4})
                    .position({
                      x:0,y:0
                    })
                  Row(){
                    Text('沉浸式')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                  }
                  .padding({top:5,bottom:3,left:10,right:10})
                  .backgroundColor(Color.Black)
                  .position({
                    x:0,y:198
                  })
                  Text('北京·沉浸式互动经典大戏《电影皇后》即兴飙戏爆笑悬疑民国变装')
                    .fontSize(15)
                    .maxLines(2)
                    .fontWeight(FontWeight.Medium)
                    .lineHeight(23)
                    .padding(6)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                    .position({
                      y:228
                    })
                  Text('5月30日开演')
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .position({
                      y:290
                    })
                    .padding({left:6})
                  Row(){
                    Text('￥')
                      .fontSize(15)
                      .fontColor('#F27500')
                    Text('99')
                      .fontSize(22)
                      .fontColor('#F27500')
                      .fontWeight(FontWeight.Bolder)
                    Text('起')
                      .fontSize(14)
                      .fontColor(Color.Gray)
                      .margin({left:4})
                    Text('套票8.3折起')
                      .fontSize(14)
                      .fontColor('#F27500')
                      .margin({left:8})
                  }
                  .padding({left:6})
                  .position({
                    y:315
                  })
                }
                .position({
                  x:0,y:0
                })

              }
              .width('97%')
              .margin({top:10})
              .height(350)
              .backgroundColor(Color.White)
              .borderRadius(4)
              FlowItem(){
                Column(){
                  Image($r('app.media.pb4'))
                    .width('100%')
                    .height('auto')
                    .borderRadius({topRight:4,topLeft:4})
                    .position({
                      x:0,y:0
                    })
                  Row(){
                    Text('话剧')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                  }
                  .padding({top:5,bottom:3,left:10,right:10})
                  .backgroundColor(Color.Black)
                  .position({
                    x:0,y:195
                  })
                  Text('北京话剧《屠夫》')
                    .fontSize(15)
                    .maxLines(2)
                    .fontWeight(FontWeight.Medium)
                    .lineHeight(23)
                    .padding(6)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                    .position({
                      y:228
                    })
                  Text('6月20日开演')
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .position({
                      y:280
                    })
                    .padding({left:6})
                  Row(){
                    Text('￥')
                      .fontSize(15)
                      .fontColor('#F27500')
                    Text('40')
                      .fontSize(22)
                      .fontColor('#F27500')
                      .fontWeight(FontWeight.Bolder)
                    Text('起')
                      .fontSize(14)
                      .fontColor(Color.Gray)
                      .margin({left:4})
                  }
                  .padding({left:6})
                  .position({
                    y:315
                  })
                }
                .position({
                  x:0,y:0
                })

              }
              .width('95%')
              .margin({top:10,left:5})
              .height(350)
              .backgroundColor(Color.White)
              .borderRadius(4)
              FlowItem(){
                Column(){
                  Image($r('app.media.pb5'))
                    .width('100%')
                    .height('auto')
                    .borderRadius({topRight:4,topLeft:4})
                    .position({
                      x:0,y:0
                    })
                  Row(){
                    Text('演唱会')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                    Text('|')
                      .fontSize(10)
                      .fontColor(Color.Gray)
                      .margin({left:5,right:5})
                    Text('2.5')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bolder)
                    Text('万想看')
                      .fontSize(13)
                      .fontColor(Color.White)
                  }
                  .padding({top:5,bottom:3,left:10,right:10})
                  .backgroundColor(Color.Black)
                  .position({
                    x:0,y:200
                  })
                  Text('南京·Beyond乐队叶世荣【你中有我】巡回演唱会')
                    .fontSize(15)
                    .maxLines(2)
                    .fontWeight(FontWeight.Medium)
                    .lineHeight(23)
                    .padding(6)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                    .position({
                      y:233
                    })
                  Text('6月27日开演')
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .position({
                      y:293
                    })
                    .padding({left:6})
                  Row(){
                    Text('￥')
                      .fontSize(15)
                      .fontColor('#F27500')
                    Text('380')
                      .fontSize(22)
                      .fontColor('#F27500')
                      .fontWeight(FontWeight.Bolder)
                    Text('起')
                      .fontSize(14)
                      .fontColor(Color.Gray)
                      .margin({left:4})
                  }
                  .padding({left:6})
                  .position({
                    y:315
                  })
                }
                .position({
                  x:0,y:0
                })

              }
              .width('97%')
              .margin({top:10})
              .height(350)
              .backgroundColor(Color.White)
              .borderRadius(4)
              FlowItem(){
                Column(){
                  Image($r('app.media.pb6'))
                    .width('100%')
                    .height('auto')
                    .borderRadius({topRight:4,topLeft:4})
                    .position({
                      x:0,y:0
                    })
                  Row(){
                    Text('沉浸式')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                    Text('|')
                      .fontSize(10)
                      .fontColor(Color.Gray)
                      .margin({left:5,right:5})
                    Text('9.3')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bolder)
                    Text('分')
                      .fontSize(13)
                      .fontColor(Color.White)
                  }
                  .padding({top:5,bottom:3,left:10,right:10})
                  .backgroundColor(Color.Black)
                  .position({
                    x:0,y:193
                  })
                  Text('北京·超口碑行进式沉浸悬疑剧《大明万历拍案惊奇》·苗九龄戏剧作品')
                    .fontSize(15)
                    .maxLines(2)
                    .fontWeight(FontWeight.Medium)
                    .lineHeight(23)
                    .padding(6)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                    .position({
                      y:218
                    })
                  Text('6月5日开演')
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .position({
                      y:280
                    })
                    .padding({left:6})
                  Row(){
                    Text('￥')
                      .fontSize(15)
                      .fontColor('#F27500')
                    Text('380')
                      .fontSize(22)
                      .fontColor('#F27500')
                      .fontWeight(FontWeight.Bolder)
                    Text('起')
                      .fontSize(14)
                      .fontColor(Color.Gray)
                      .margin({left:4})
                  }
                  .padding({left:6})
                  .position({
                    y:305
                  })
                }
                .position({
                  x:0,y:0
                })

              }
              .width('95%')
              .margin({top:10,left:5})
              .height(350)
              .backgroundColor(Color.White)
              .borderRadius(4)
              FlowItem(){
                Column(){
                  Image($r('app.media.pb7'))
                    .width('100%')
                    .height('auto')
                    .borderRadius({topRight:4,topLeft:4})
                    .position({
                      x:0,y:0
                    })
                  Row(){
                    Text('演唱会')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                    Text('|')
                      .fontSize(10)
                      .fontColor(Color.Gray)
                      .margin({left:5,right:5})
                    Text('2.7')
                      .fontSize(13)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bolder)
                    Text('万想看')
                      .fontSize(13)
                      .fontColor(Color.White)
                  }
                  .padding({top:5,bottom:3,left:10,right:10})
                  .backgroundColor(Color.Black)
                  .position({
                    x:0,y:198
                  })
                  Text('沈阳·井胧井迪【Our·我们】—— 【幸好有你并肩】演唱会沈阳站')
                    .fontSize(15)
                    .maxLines(2)
                    .fontWeight(FontWeight.Medium)
                    .lineHeight(23)
                    .padding(6)
                    .textOverflow({
                      overflow:TextOverflow.Ellipsis
                    })
                    .position({
                      y:223
                    })
                  Text('6月20日开演')
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .position({
                      y:288
                    })
                    .padding({left:6})
                  Row(){
                    Text('￥')
                      .fontSize(15)
                      .fontColor('#F27500')
                    Text('177')
                      .fontSize(22)
                      .fontColor('#F27500')
                      .fontWeight(FontWeight.Bolder)
                    Text('起')
                      .fontSize(14)
                      .fontColor(Color.Gray)
                      .margin({left:4})
                  }
                  .padding({left:6})
                  .position({
                    y:315
                  })
                }
                .position({
                  x:0,y:0
                })

              }
              .width('97%')
              .margin({top:10})
              .height(350)
              .backgroundColor(Color.White)
              .borderRadius(4)

            }
            .columnsTemplate('1fr 1fr')
            .width('95%')
            .height('auto')
          }
          .margin({bottom:60,top:80})
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