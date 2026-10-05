import router from '@ohos.router';

@Entry
@Component
struct SplashBrand {
  private stayTime: number = 2000;

  // 标记是否已经跳转，防止重复跳转
  private hasNavigated: boolean = false;

  aboutToAppear() {
    this.hasNavigated = false;
    setTimeout(() => {
      // 双重判断：页面实例存在且未跳转过
      if (this && !this.hasNavigated) {
        this.hasNavigated = true;
        router.replaceUrl({ url: "pages/SplashAd" });
      }
    }, this.stayTime);
  }

  build() {
    Column() {
      // 上方空白区域，占满屏幕上半部分
      Column()
        .width('100%')
        .flexGrow(1)

      // ========== 底部Logo区域【固定尺寸+固定边距】==========
      Column() {
        Image($r('app.media.logo'))
          .width(120)
          .height(40)
          .objectFit(ImageFit.Contain)
        Text("阿里巴巴集团旗下品牌")
          .fontSize(14)
          .fontColor(Color.Gray)
          .margin({ top: 8 })
      }
      .width('100%')
      // 底部整体外边距，决定Logo离屏幕底部距离
      .margin({ bottom: 1 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}