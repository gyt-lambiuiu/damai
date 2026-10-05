import {xzdata} from '../model/xzdata'
@Component
struct xuzhi {
  @Prop itemobj:xzdata
  build(){
    Column(){
      Row(){
        Image($r(`app.media.${this.itemobj.tp}`))
          .width(20)
          .height(20)
          .margin({right:5})
        Text(this.itemobj.gz)
          .fontSize(13)
      }
      .width('100%')
      Text(this.itemobj.xxgz)
        .fontColor(Color.Gray)
        .fontSize(12)
        .maxLines(1)
        .width('100%')
        .textOverflow({overflow:TextOverflow.Ellipsis})
    }
    .justifyContent(FlexAlign.SpaceAround)
    .margin({bottom:7})
    .borderRadius(8)
    .padding(8)
    .height(60)
    .backgroundColor('#FFF7F7F9')

  }
}
export default xuzhi