import { userLogin } from '../api/api';
import { saveToken } from '../utils/request';
import router from '@ohos.router';

// 品牌主题色（大麦红粉渐变）
const BRAND_COLOR: string = '#EF2F6E';
const BRAND_GRADIENT_START: string = '#FF5B93';
const BRAND_GRADIENT_END: string = '#EF2F6E';

@Entry
@Component
struct LoginPage {
  @State username: string = "" // 账号，默认置空，让用户自己输入（否则为空校验永远触发不了）
  @State pwd: string = ""      // 密码，默认置空
  @State showPwd: boolean = false // 密码可见切换
  @State agree: boolean = false   // 协议勾选状态

  // 按钮是否可点亮（仅做视觉反馈，校验仍在点击时做）
  private canSubmit(): boolean {
    return this.username.trim() !== "" && this.pwd.trim() !== ""
  }

  async submitLogin(): Promise<void> {
    // ① 未勾选协议 → 提示并结束
    if (!this.agree) {
      this.getUIContext().getPromptAction().showToast({ message: "请先勾选并同意用户服务协议和隐私政策" })
      return
    }
    // ② 本地校验：账号或密码为空 → 提示，直接结束，不发请求
    if (this.username.trim() === "" || this.pwd.trim() === "") {
      this.getUIContext().getPromptAction().showToast({ message: "账号密码不能为空" })
      return
    }

    try {
      // ③ 不为空，调用接口，把 username、password 传给 Apifox Mock
      const res = await userLogin(this.username, this.pwd)

      // ④ 接口返回成功：跳转首页
      if (res.code === 200) {
        // Mock 成功响应只有 code+msg，没有 token 字段，做空值保护避免报错
        if (res.data && res.data.token) {
          await saveToken(res.data.token)
        }
        this.getUIContext().getPromptAction().showToast({ message: "登录成功" })
        router.replaceUrl({ url: "pages/second" })
      } else {
        // ⑤ 接口返回失败：弹窗提示，不跳转页面
        this.getUIContext().showAlertDialog({
          title: "提示",
          message: "账号或密码错误",
          confirm: {
            value: "确定",
            action: () => {}
          }
        })
      }
    } catch (e) {
      // 网络异常等兜底提示
      this.getUIContext().getPromptAction().showToast({ message: "网络请求失败，请检查Apifox服务" })
      console.error("登录失败" + JSON.stringify(e))
    }
  }

  // 协议勾选圆圈
  @Builder
  AgreeCircle() {
    Row() {
      if (this.agree) {
        Text('✓')
          .fontSize(10)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
      }
    }
    .width(16)
    .height(16)
    .borderRadius(8)
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .border({ width: 1, color: this.agree ? BRAND_COLOR : '#CCCCCC' })
    .backgroundColor(this.agree ? BRAND_COLOR : Color.Transparent)
    .onClick(() => {
      this.agree = !this.agree
    })
  }

  // 第三方登录圆形入口
  @Builder
  ThirdLoginItem(label: string, labelColor: string) {
    Column() {
      Text(label)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(labelColor)
    }
    .width(44)
    .height(44)
    .borderRadius(22)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .border({ width: 1, color: '#EEEEEE' })
    .backgroundColor(Color.White)
    .onClick(() => {
      this.getUIContext().getPromptAction().showToast({ message: "暂不支持" + label + "登录" })
    })
  }

  build() {
    Column() {
      // ===== 顶部导航栏：返回 + 帮助 =====
      Row() {
        Image($r('app.media.ic_back'))
          .width(22)
          .height(22)
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            router.back()
          })
        Blank()
        Text('帮助')
          .fontSize(14)
          .fontColor('#999999')
      }
      .width('100%')
      .height(48)
      .padding({ left: 16, right: 16 })

      // ===== 标题区 =====
      Column({ space: 6 }) {
        Text('你好，')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A1A')
        Text('欢迎来到大麦')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A1A')
        Text('登录后即可购票、查看演出信息')
          .fontSize(13)
          .fontColor('#999999')
          .margin({ top: 6 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 24, right: 24 })
      .margin({ top: 16 })

      // ===== 输入区 =====
      Column({ space: 14 }) {
        // 账号输入框
        Row({ space: 10 }) {
          Image($r('app.media.ic_user'))
            .width(22)
            .height(22)
            .objectFit(ImageFit.Contain)
          TextInput({ text: this.username, placeholder: '请输入账号' })
            .layoutWeight(1)
            .height(40)
            .fontSize(16)
            .fontColor('#1A1A1A')
            .placeholderColor('#BBBBBB')
            .placeholderFont({ size: 16 })
            .backgroundColor(Color.Transparent)
            .padding(0)
            .onChange((val: string) => {
              this.username = val
            })
        }
        .width('100%')
        .height(52)
        .padding({ left: 14, right: 14 })
        .borderRadius(10)
        .backgroundColor('#F7F7F7')

        // 密码输入框
        Row({ space: 10 }) {
          Image($r('app.media.ic_lock'))
            .width(22)
            .height(22)
            .objectFit(ImageFit.Contain)
          TextInput({ text: this.pwd, placeholder: '请输入密码' })
            .layoutWeight(1)
            .height(40)
            .fontSize(16)
            .fontColor('#1A1A1A')
            .placeholderColor('#BBBBBB')
            .placeholderFont({ size: 16 })
            .backgroundColor(Color.Transparent)
            .padding(0)
            .type(this.showPwd ? InputType.Normal : InputType.Password)
            .onChange((val: string) => {
              this.pwd = val
            })
            .onSubmit(() => {
              this.submitLogin()
            })
          Image(this.showPwd ? $r('app.media.ic_eye_open') : $r('app.media.ic_eye_close'))
            .width(22)
            .height(22)
            .objectFit(ImageFit.Contain)
            .onClick(() => {
              this.showPwd = !this.showPwd
            })
        }
        .width('100%')
        .height(52)
        .padding({ left: 14, right: 14 })
        .borderRadius(10)
        .backgroundColor('#F7F7F7')
      }
      .width('100%')
      .padding({ left: 24, right: 24 })
      .margin({ top: 32 })

      // ===== 协议勾选 =====
      Row({ space: 6 }) {
        this.AgreeCircle()
        Text() {
          Span('已阅读并同意')
            .fontColor('#999999')
          Span('《大麦用户服务协议》')
            .fontColor(BRAND_COLOR)
          Span('和')
            .fontColor('#999999')
          Span('《大麦隐私权政策》')
            .fontColor(BRAND_COLOR)
        }
        .fontSize(12)
        .lineHeight(16)
      }
      .width('100%')
      .padding({ left: 24, right: 24 })
      .margin({ top: 16 })

      // ===== 登录按钮（品牌渐变胶囊） =====
      Button('登录')
        .width('100%')
        .height(46)
        .fontSize(17)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.White)
        .backgroundColor(Color.Transparent)
        .linearGradient({
          angle: 90,
          colors: [[BRAND_GRADIENT_START, 0.0], [BRAND_GRADIENT_END, 1.0]]
        })
        .borderRadius(23)
        .opacity(this.canSubmit() ? 1.0 : 0.5)
        .margin({ top: 28 })
        .onClick(() => {
          this.submitLogin()
        })

      // ===== 辅助链接 =====
      Row() {
        Text('短信登录/注册')
          .fontSize(14)
          .fontColor('#333333')
          .onClick(() => {
            this.getUIContext().getPromptAction().showToast({ message: "演示版暂不支持短信登录" })
          })
        Blank()
        Text('忘记密码')
          .fontSize(14)
          .fontColor('#333333')
          .onClick(() => {
            this.getUIContext().getPromptAction().showToast({ message: "演示版暂不支持找回密码" })
          })
      }
      .width('100%')
      .padding({ left: 24, right: 24 })
      .margin({ top: 18 })

      Blank()

      // ===== 底部第三方登录 =====
      Column() {
        Row({ space: 10 }) {
          Divider()
            .layoutWeight(1)
            .strokeWidth(1)
            .color('#EEEEEE')
          Text('其他登录方式')
            .fontSize(12)
            .fontColor('#BBBBBB')
          Divider()
            .layoutWeight(1)
            .strokeWidth(1)
            .color('#EEEEEE')
        }
        .width('100%')
        .padding({ left: 40, right: 40 })

        Row({ space: 30 }) {
          this.ThirdLoginItem('微', '#09BB07')
          this.ThirdLoginItem('支', '#1677FF')
          this.ThirdLoginItem('博', '#E6162D')
        }
        .margin({ top: 20 })
      }
      .width('100%')
      .padding({ bottom: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
