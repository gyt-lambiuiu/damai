import { getShowList } from './api';

interface ShowItem {
  id: number;
  singer_name: string;
  city: string;
  category: string;
  show_time: string;
  venue: string;
  is_sale: number;
  cover_img: string;
  min_price: number;
}

@Entry
@Component
struct ShowHomePage {
  @State showData: ShowItem[] = []
  page: number = 1
  readonly pageSize: number = 10
  isLoading: boolean = false

  async loadData() {
    if(this.isLoading) return;
    this.isLoading = true;
    try {
      const res = await getShowList(this.page, this.pageSize);
      if (res.code === 200) {
        if(this.page === 1){
          this.showData = res.data;
        }else{
          this.showData = this.showData.concat(res.data);
        }
      }
    } catch (err) {
      console.error("加载演出失败", JSON.stringify(err));
    }
    this.isLoading = false;
  }

  aboutToAppear() {
    this.loadData();
  }

  build() {
    List({ space: 10 }) {
      ForEach(this.showData, (item: ShowItem) => {
        ListItem() {
          Column({ space: 6 }) {
            Text(item.singer_name).fontSize(18).fontWeight(FontWeight.Bold)
            Text(`${item.city} | ${item.category}`).fontColor("#666")
            Text(item.show_time)
            Text(`¥${item.min_price}`).fontColor("#f40")
          }
          .padding(12)
          .width("100%")
          .backgroundColor(Color.White)
          .borderRadius(8)
        }
      })
    }
    .padding(10)
    .width("100%")
    .height("100%")
    .backgroundColor("#f5f5f5")
  }
}