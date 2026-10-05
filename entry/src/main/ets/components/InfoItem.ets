import { CommentData } from '../model/CommentData'

@Component
struct InfoItem {
  @Prop itemObj: CommentData
  @Prop isPreview: boolean = false
  @Prop index:number
  onLikeClick=(index:number)=>{}

  build() {
    Column(){
      //1.头像、昵称、等级、评价
      Row(){
        Image($r(`app.media.${this.itemObj.avatar}`))
          .width(40).aspectRatio(1)
          .margin({top:10})
          .borderRadius(20)
        Column(){
          Row(){
            Text(this.itemObj.name)
              .fontSize(15)
              .margin({left:10,top:8})
            Image($r(`app.media.${this.itemObj.lever}`))
              .width(80).height(14)
              .borderRadius(2)
              .margin({left:5,top:8})
          }
          Image($r(`app.media.${this.itemObj.pingjia}`))
            .width(80).height(13)
            .margin({left:10,top:5})
        }
        .alignItems(HorizontalAlign.Start)

      }
      .width('100%')
      .padding({left:10,right:10})

      //2.评论内容、配图
      Text(this.itemObj.commentTxt)
        .fontSize(15)
        .width('100%')
        .margin({left:120,top:10,bottom:10})
      Row(){
        Image($r(`app.media.${this.itemObj.tupian}`))
          .width(75)
          .height(75)
          .borderRadius(8)
      }
      .width('100%')
      .margin({left:120,top:10,bottom:20})

      //3.日期、点赞互动
      Row(){
        Text(this.itemObj.sjdd)
          .fontColor(Color.Gray)
          .fontSize(12)
        Row({space:3}){
          Image(this.itemObj.islike ? $r('app.media.dianzancg') : $r('app.media.dianzan'))
            .width(14).aspectRatio(1)
            .onClick(()=>{
              this.onLikeClick(this.index)

            })
          Text(this.itemObj.likeNum.toString())
            .fontColor(Color.Gray)
            .fontSize(12)
          Image($r('app.media.pinglun'))
            .width(14).aspectRatio(1)
          Text(this.itemObj.commentNum.toString())
            .fontColor(Color.Gray)
            .fontSize(12)
          Image($r('app.media.gengduo'))
            .width(14).aspectRatio(1)
        }
        .margin({left:30})
      }
      .margin({left:120,top:5,bottom:20,right:15})
      .width('100%')
    }
    .margin({top:14})

  }
}

export default InfoItem