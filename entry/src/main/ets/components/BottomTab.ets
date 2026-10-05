import router from'@ohos.router';
interface NavItem {
  normal: ResourceStr;
  selected: ResourceStr;
  text: string;
  pagePath: string;
}
@Component
export struct BottomTab{
  @Link selectIndex:number;

  // 用上面定义的接口来标注类型
  navList: NavItem[] = [
    { normal: $r("app.media.jx"), selected: $r("app.media.jxs"), text: "精选", pagePath: "pages/second" },
    { normal: $r("app.media.xc"), selected: $r("app.media.xcs"), text: "现场",pagePath: "pages/second"},
    { normal: $r("app.media.dmvip"), selected: $r("app.media.dmvips"), text: "大麦VIP", pagePath: "pages/second" },
    { normal: $r("app.media.pj"), selected: $r("app.media.pjs"), text: "票夹", pagePath: "pages/second" },
    { normal: $r("app.media.vip"), selected: $r("app.media.wdg"), text: "我的", pagePath: "pages/Index" }
  ];

  build(){
    Row(){
      ForEach(this.navList,(item:NavItem,index:number)=>{
        Column() {
          Column() {
            Image(this.selectIndex === index ? item.selected : item.normal)
              .width('100%')
              .height('100%')
              .objectFit(ImageFit.Contain)
              .margin({ bottom: 2 })
          }
          .width(28)
          .height(28)
          Text(item.text)
            .fontSize(12)
        }
        .layoutWeight(1)
        .onClick(()=> {
          this.selectIndex = index;
          // 加上这一行实现跳转，不额外改动你的逻辑
          router.replaceUrl({ url: item.pagePath });
        })
      })
    }
    .width('100%')
    .height(60)
    .backgroundColor(Color.White)
  }
}