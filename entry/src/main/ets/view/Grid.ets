@Component
export default struct Setting {
  // 定义一个长度为16的数组
  private arr: string[] = new Array(16).fill('').map((_, index) => `数据 ${index}`);

  build() {
    Column() {
      Grid() {
        ForEach(this.arr, (item: any, index: number) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .fontColor(Color.White)
              .backgroundColor(0x007DFF)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }.onClick(() => {
            console.log('点击的内容为:' + item, '下标为' + index)
          })
        }, item => item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .height(300)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor(0xF1F3F5)
  }
}