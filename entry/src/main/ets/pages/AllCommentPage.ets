import router from '@ohos.router';
import { window } from '@kit.ArkUI';
import { BottomTab } from '../components/BottomTab';
import { ORDER_ENTRIES, SERVICE_ITEMS, PROFILE_BANNERS, OrderEntry, ServiceItem } from '../model/ProfileModel';
// 定义参数接口，放在import下面
import { CommentData, createListRange } from '../model/CommentData'
import InfoItem from '../components/InfoItem'
interface CommentPageParam {
  selectTag?: string
}

@Entry
@Component
struct AllCommentPage {

  @State CommentList: CommentData[]= createListRange()

  aboutToAppear() {
    this.hideSystemNavigationBar();
    const params = router.getParams() as CommentPageParam
    if(params && params.selectTag) {
      this.activeTag = params.selectTag
    }
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

  handleLike(index:number){
    let itemData = this.CommentList[index]
    if (itemData.islike){
      itemData.likeNum -=1
    }
    else{
      itemData.likeNum+=1
    }
    itemData.islike=!itemData.islike
    this.CommentList.splice(index,1,itemData)

  }

  @State activeTag: string = "全部"
  private tagArr: string[] = ["全部","最新","精选","必看","有图","本站评"]


  build() {
    Column() {
      //顶部返回导航栏，sys系统图片容易报错，这里换成文字返回，避免资源找不到
      Row() {
        Image($r('sys.media.ohos_ic_public_arrow_left'))
          .width(28)
          .height(28)
          .onClick(()=>{ router.back() })
        Text("全部评价")
          .fontSize(20)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .backgroundColor(Color.White)
      .height(60)
      .padding({left:12, right:12,top:22,bottom:5})

      // -----标签区域开始-----
      //第一行：横向滚动标签
      Scroll() {
        Row() {
          ForEach(["全部","最新","精选","必看","有图"], (tag:string)=>{
            Text(tag)
              .fontSize(13)
              .fontColor(this.activeTag === tag ? Color.White : Color.Black)
              .backgroundColor(this.activeTag === tag ? '#ff2e88' : Color.White)
              .padding({ left:14, right:14, top:10, bottom:10 })
              .borderRadius(999)
              .margin({ right:10 })
              .onClick(()=>{
                this.activeTag = tag
              })
          })
        }
        .margin({bottom:10,top:12})
      }
      .backgroundColor('#FFF7F7F9')
      .scrollBar(BarState.Off)
      .width('100%')
      .padding({left:16, right:16})

      //第二行，单独一行：本站评
      Row(){
        Text("本站评")
          .fontSize(13)
          .fontColor(this.activeTag === "本站评" ? Color.White : Color.Black)
          .backgroundColor(this.activeTag === "本站评" ? '#ff2e88' : Color.White)
          .padding({ left:14, right:14, top:10, bottom:10 })
          .borderRadius(999)
          .width('fit-content')
          .margin({left:18,bottom:12})
          .onClick(()=>{
            this.activeTag = "本站评"
          })
      }
      .width('100%')
      .backgroundColor('#FFF7F7F9')
      // -----标签区域结束-----

      Scroll() {
        Column(){
          ForEach(this.CommentList, (item:CommentData,index:number) =>{
            //列表项组件 -将item对象，通过prop传值，传递下去
            InfoItem({
              index:index,
              itemObj: item,
              isPreview:true,
              onLikeClick:(index:number)=>{
                this.handleLike(index)
              }//详情预览模式，文字折叠最多3行
            })
              .width('100%')
              .margin({bottom:10})
              .backgroundColor(Color.White)
              .borderRadius(8)
          })
        }
        .width('95%')
        .layoutWeight(1)
        .padding({bottom:180})


      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .backgroundColor('#FFF7F7F9')
  }
}
