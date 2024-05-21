import TitleBar from '../../common/TitleBar'

@Entry
@Component
struct VideoPage {
  private contor: VideoController;

  build() {
    Column() {
      TitleBar({hasBackPress:true,title:"视频组件"});

      //视频播放器
      Video({
        src: 'http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4', //视频本地路径或者URL地址
        // previewUri:'https://lmg.jj20.com/up/allimg/1113/042220121425/200422121425-3-1200.jpg',//未播放时候的预览图,可本地可url地址
        previewUri: $r('app.media.ic_movie_seven'),
        controller: this.contor, //video播放的控制器
      })
        .width('100%') //宽度
        .height(200) //高度
        .objectFit(ImageFit.Auto) //视频显示区域mode
        .autoPlay(false) //是否自动播放
        .controls(true) //是否显示播放相关按钮
        .loop(false) //是否循环播放
    }
    .backgroundColor(0xf5f5f5)
  }
}