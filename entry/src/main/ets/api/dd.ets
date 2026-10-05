import { getMyOrder } from './api';
interface OrderItem {
  id: number;
  show_name: string;
  seat_info: string;
  price: number;
  create_time: string;
}
@Entry
@Component
struct OrderPage {
  @State orderList: OrderItem[] = []

  async getOrderList() {
    try {
      const res = await getMyOrder();
      if(res.code === 200){
        this.orderList = res.data;
      }
    } catch (e) {
      console.error("获取订单失败",JSON.stringify(e))
    }
  }

  aboutToAppear() {
    this.getOrderList();
  }

  build() {
    List(){
      ForEach(this.orderList, (item: OrderItem)=>{
        ListItem(){
          Column(){
            Text(JSON.stringify(item))
          }
          .padding(10)
        }
      })
    }
  }
}