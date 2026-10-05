//准备评论的数据类
export class CommentData {
  avatar: string //头像
  name: string //昵称
  lever: string//等级
  pingjia: string  //评价
  commentTxt: string //评论内容
  tupian: string  //附图
  sjdd:string //发布时间和地点
  islike: boolean //是否喜欢
  likeNum: number //喜欢数量
  commentNum: number //评论数量
  time: number //时间戳

  constructor(avatar:  string ,name: string,lever: string  ,pingjia: string  ,commentTxt: string,tupian:  string ,sjdd:string,islike: boolean,likeNum: number,commentNum: number,time: number) {
    this.avatar=avatar
    this.name=name
    this.lever=lever
    this.pingjia=pingjia
    this.commentTxt=commentTxt
    this.tupian=tupian
    this.sjdd=sjdd
    this.islike=islike
    this.likeNum=likeNum
    this.commentNum=commentNum
    this.time=time
  }
}
//封装一个方法，创建假数据
export const createListRange = ():CommentData[] =>{
  let result:CommentData[] = new Array()
  result = [
    new CommentData("tx1","麦子6z7tD","heizuan","jihao","最最最值得和用心的演唱会","xc1",'2026.01.26 00:49 济南站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1769356800),
    new CommentData("tx2","ashorestar","heizuan","jihao","陈粒！太值了！","xc2",'2026.06.30 18:37 青岛站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1782777600),
    new CommentData("tx3","大麦求原生票来爱你","heizuan","jihao","十年一粒，可爱美丽","xc3",'2026.01.19 15:49 武汉站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1768780800),
    new CommentData("tx4","小叶","heizuan","jihao","这场演出堪称视听美学的盛宴","xc4",'2025.09.22 02:59 上海站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1758499200),
    new CommentData("tx5","陌上人shy","heizuan","jihao","无敌幸福的跨年场","xc5",'2025.08.13 01:49 福州站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1755043200),
    new CommentData("tx6","麦子aoquz","heizuan","jihao","粒粒太美了！！！","xc6",'2026.11.26 00:19 北京站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1795651200),
    new CommentData("tx7","是佳小姐啊","heizuan","jihao","这是我今年来过最最最正确的演唱会","xc7",'2024.04.20 02:33 泉州站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1713571200),
    new CommentData("tx8","OOK哈哈哈","heizuan","jihao","记我第一次看演唱会","xc8",'2026.02.11 03:11 厦门站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1770768000),
    new CommentData("tx9","起个名字好难","heizuan","jihao","好看爱看还要再看","xc9",'2026.10.26 02:30 济南站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1792972800),
    new CommentData("tx10","ZOX-","heizuan","jihao","唱的很稳很用心，氛围好，体验很棒","xc10",'2025.11.11 00:00 西安站',false,Math.floor(Math.random()*100),Math.floor(Math.random()*100),1762819200)

  ]
  return result
}
