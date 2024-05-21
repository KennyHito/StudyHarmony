import TitleBar from '../../common/TitleBar'

@Entry
@Component
struct ImagePage {
  build() {
    Column() {
      TitleBar({hasBackPress:true,title:"图片组件"});

      //本地图片
      Image($r('app.media.ic_movie_eight'))
        .height(200)
        .width('100%')
        .onClick(() => {
          console.log('yhtTest------->:' + '2023年11月20日14:06:12');
        })

      //类似一个空行
      Text().height(10).width('100%').backgroundColor(Color.Red);

      //网络图片
      Image('https://t7.baidu.com/it/u=3779234486,1094031034&fm=193&f=GIF')
        .height(200)
        .width('100%')
    }
    .backgroundColor(0xf5f5f5)
  }
}