export class wntjdata {
  tp:string;
  yc:string;
  yy:string;
  sj:string;
  dd:string;
  jg:string

  constructor(tp:string,yc:string,yy:string,sj:string,dd:string,jg:string) {
    this.tp=tp
    this.yc=yc
    this.yy=yy
    this.sj=sj
    this.dd=dd
    this.jg=jg
  }
}
export const createwntj =():wntjdata[]=>{
  let result:wntjdata[]=new Array()
  result = [
    new wntjdata("tj1","【佛山】徐良“时间折叠”巡回演唱会-佛山站","徐良","2026.09.04-09.06","佛山国际体育文化演艺中心","380"),
    new wntjdata("tj2","【深圳】“听见中国听见你”原创音乐盛典","演唱会上新榜NO.1","2026.09.22周二 20:00","深圳湾体育中心“春茧”体育场","180"),
    new wntjdata("tj3","【北京】王嘉尔JACK SON 2演唱会-北京站","王嘉尔","2026.10.17-10.18","华熙生物·润百颜ECM中心","499"),
    new wntjdata("tj4","【西安】回春丹大把时间璀璨2026演唱会西安站","回春丹乐队","2026.0912周六 18:18","汉长安城未央宫国家考古遗址公园","280"),
    new wntjdata("tj5","【苏州】“国风起时”苏州国风音乐盛典","胡彦斌;李常超;音频怪物","2026.0925-09.26","苏州市体育中心体育场","180")
    ]
  return result
}