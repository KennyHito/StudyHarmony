import router from '@ohos.router';
import TitleBar from '../common/TitleBar'

@Component
export default struct Home {
  /// 上一个页面传过来的数据
  @State str: string = router.getParams()?.['src']

  /// 数据源
  private arr = [
    { "key": "pages/DialogPage/DialogPage", "name": "弹窗组件" },
    { "key": "pages/VideoPage/VideoPage", "name": "视频组件" },
    { "key": "pages/ImagePage/ImagePage", "name": "图片组件" },
    { "key": "pages/WebPage/WebPage", "name": "Web组件" },
    { "key": "pages/NetworkPage/NetworkPage", "name": "网络请求组件" },
    { "key": "pages/FlexPage/FlexPage", "name": "Flex组件" }
  ];

  build() {
    Column() {
      TitleBar();

      Text(this.str);

      this.getListView();
    }
    .height('100%')
    .width('100%')
    .backgroundColor(0xF1F3F5)
  }

  @Builder
  private getListView() {
    List({ space: 10 }) {
      ForEach(this.arr, (item: any, index: number) => {
        ListItem() {
          Text(this.arr[index].name)
            .width('90%')
            .height(50)
            .fontSize(20)
            .fontColor(Color.White)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0x007DFF)
        }.onClick(() => {
          /// ListItem点击事件
          let url = this.arr[index].key;
          if (url === '') {
            return;
          }
          router.pushUrl({
            url: url,
            params: {
              src: '我是上一个页面传过来的数据'
            }
          }).catch((error: Error) => {
            console.log(JSON.stringify(error));
          });
        })
      }, item => item)
    }
    .alignListItem(ListItemAlign.Center)
  }
}