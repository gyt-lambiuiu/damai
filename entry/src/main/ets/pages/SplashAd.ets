import router from '@ohos.router';
import { window } from '@kit.ArkUI';
@Entry
@Component
struct SplashAd {
  // 广告停留时长：3秒
  private readonly stayTime: number = 3000;
  // 倒计时变量，用于显示剩余时间
  @State countDown: number = 3;
  // 定时器ID，用于手动取消
  private timerId: number | null = null;

  aboutToAppear() {
    // 启动倒计时
    this.startCountDown();
    // 在页面即将出现时设置全屏和隐藏系统导航栏
    this.hideSystemNavigationBar();
  }

  // 启动倒计时
  private startCountDown() {
    this.timerId = setInterval(() => {
      this.countDown--;
      if (this.countDown <= 0) {
        this.skipToHome();
      }
    }, 1000);

    // 同时设置总时长，兜底防止定时器异常
    setTimeout(() => {
      this.skipToHome();
    }, this.stayTime);
  }

  // 跳转到首页（公共方法，点击跳过也会调用）
  private skipToHome() {
    // 先清除定时器，防止重复执行
    if (this.timerId !== null) {
      clearInterval(this.timerId);
      this.timerId = null;
    }
    // 跳转到首页，用replaceUrl避免用户按返回键回到开屏页
    router.replaceUrl({ url: "pages/second" });
  }
  // 在页面即将出现时设置全屏和隐藏系统导航栏
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
    Column(){
      Column() {
        // 1. 广告主图
        Stack({ alignContent: Alignment.Bottom }) {
          // 广告图片
          Image($r('app.media.dy1')) // 替换为你的话剧海报资源
            .width('100%')
            .height('83%')
            .objectFit(ImageFit.Cover)

          // 底部"点击跳转"按钮
          Button("点击跳转至详情页面 >")
            .width('80%')
            .height(50)
            .margin({ bottom: 40 })
            .backgroundColor('#80000000')
            .fontColor(Color.White)
            .onClick(() => {
              // 点击跳转广告详情，这里用首页代替，你可以改成实际的详情页路径
              router.pushUrl({ url: "pages/AdDetail" });
            })
        }

        // 2. 底部品牌logo（和品牌页保持一致）
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
        .margin({ top: 40 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.White)

      // 右上角跳过按钮（绝对定位）
      Stack({ alignContent: Alignment.TopEnd }) {
        Column() {
          Button(`${this.countDown} 跳过`)
            .width(70)
            .height(30)
            .borderRadius(15)
            .backgroundColor('#80000000') // 半透明黑色背景
            .fontColor(Color.White)
            .fontSize(12)
            .onClick(() => {
              this.skipToHome();
            })
        }
        .margin({ top: 35, right: 20 })
      }
      .width('100%')
      .height('100%')
      .position({ x: 0, y: 0 })
    }
  }
}
