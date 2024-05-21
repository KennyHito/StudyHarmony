import router from '@ohos.router'

@Component
export default struct TitleBar {
  private title: string | Resource = $r('app.string.EntryAbility_label')
  private hasBackPress: boolean = false

  build() {
    Row() {
      if (this.hasBackPress) {
        Image($r('app.media.ic_back'))
          .width(20).height(20)
          .objectFit(ImageFit.Auto)
          .onClick(() => {
            router.back()
          })
      }
      Text(this.title)
        .fontColor(Color.Black)
        .fontSize(18)
    }
    .width('100%')
    .height(49)
    .constraintSize({ minHeight: 49 })
    .padding({ left: 10, right: 10 })
    .backgroundColor(Color.White)
  }
}