export class xzdata {
  tp:string;
  gz:string;
  xxgz:string

  constructor(tp:string,gz:string,xxgz:string) {
    this.tp=tp
    this.gz=gz
    this.xxgz=xxgz
  }
}

export const createxz =():xzdata[]=>{
  let result:xzdata[]=new Array()
  result = [
    new xzdata("xz1","限购规则","每笔订单最多购买6张，每个账号最多购买6张。"),
    new xzdata("xz5","退票/换票规则","本项目支持有条件退款，具体可申请退票的期间、"),
    new xzdata("xz2","入场方式说明","须携带购票时对应证件验证入场。"),
    new xzdata("xz6","儿童购票","儿童一律凭票入场"),
    new xzdata("xz3","发票说明","演出开始前，去【订单详情页】提交发票申请。"),
    new xzdata("xz7","购票证件说明","一张门票对应一个证件；证件支持：身份证/港澳居民来往内地通行证"),
    new xzdata("xz4","异常排单说明","对于异常订购行为，大麦网有权在订单成立或生效之后取消相应订单。"),
    new xzdata("xz8","温馨提示","1.购买前请您提前规划好行程，做好相应准备，以免影响您的正常观演")
  ]
  return result
}