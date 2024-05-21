import webview from '@ohos.web.webview';
import TitleBar from '../../common/TitleBar'

@Entry
@Component
struct WebPage {
  controller: webview.WebviewController = new webview.WebviewController()

  build() {
    Column() {
      TitleBar({hasBackPress:true,title:"Web组件"});

      //类似一个空行
      Text().height(10);

      Button('我是原生按钮')
        .fontSize('16fp')
        .width('90%')
        .height('40')
        .backgroundColor('#007DFF')
        .onClick(() => {
          // this.controller.zoom(1.5); //页面放大为原来的1.5倍
          this.controller.runJavaScript('htmlTest()');
        })

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .backgroundColor(Color.Orange)
        // Web({src:'https://www.baidu.com/',controller:this.controller})//需要在module.json5中配置网络请求权限ohos.permission.INTERNET
        // .textZoomRatio(150)
        // .javaScriptAccess(true)//启用JavaScript功能，默认情况下是允许JavaScript执行的
        // .zoomAccess(false)//zoomAccess用于设置是否支持手势进行缩放，默认允许执行缩放
        // .aspectRatio(1)
        .onConfirm((event) => {
          console.log('yhtTest------->:' + JSON.stringify(event));
          console.log('yhtTest------->:' + event.message);
          return true;
        })
    }
    .backgroundColor(0xf5f5f5)
    .height('100%')
  }
}