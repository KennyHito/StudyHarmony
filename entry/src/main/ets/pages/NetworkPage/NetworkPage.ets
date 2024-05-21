import http from '@ohos.net.http';
import TitleBar from '../../common/TitleBar'

@Entry
@Component
export struct NetworkPage {
  @State objA: any = Object();

  build() {
    Column() {
      TitleBar({hasBackPress:true,title:"网络请求组件"});

      //类似一个空行
      Text().height(10);

      Column() {
        Button("点一下请求一下网络数据")
          .fontSize('16fp')
          .width('90%')
          .height('40')
          .backgroundColor('#007DFF')
          .onClick(() => {

            let url = "https://api.xygeng.cn/one";
            let httpRequest = http.createHttp();

            /// 方法一
            let promise = httpRequest.request(
              // 请求url地址
              url,
              {
                // 请求方式
                method: http.RequestMethod.GET,
                // 可选，默认为60s
                connectTimeout: 60000,
                // 可选，默认为60s
                readTimeout: 60000,
                // 开发者根据自身业务需要添加header字段
                header: {
                  'Content-Type': 'application/json'
                }
              });

            promise.then((data) => {
              if (data.responseCode === http.ResponseCode.OK) {
                console.log('yhtTest------->:' + 'data.result最开始数据:', data.result);
                const obj = JSON.parse(JSON.stringify(data.result)); //序列化
                console.log('yhtTest------->:' + 'data.result序列化后:',);
                const objJ = JSON.parse(obj);
                console.log('yhtTest------->:' + 'data.result字符串转Json:', objJ);
                console.log('yhtTest------->:' + '取具体某个字段的值:', objJ.data.content);
                this.objA = Object(objJ.data);
              }
            }).catch((err) => {
              console.log('yhtTest------->:' + JSON.stringify(err));
            });

            /// 方法二
            // httpRequest.request(url,
            //   {
            //     method: http.RequestMethod.GET,
            //     header: {
            //       'Content-Type': 'application/json'
            //     },
            //     readTimeout: 60000,
            //     connectTimeout: 60000
            //   }, (err, data) => {
            //     if (!err) {
            //       const obj = JSON.parse(JSON.stringify(data.result)); //序列化
            //       const objJ = JSON.parse(obj);
            //       console.log('yhtTest------->:' + 'data.result字符串转Json:', objJ);
            //       console.log('yhtTest------->:' + '取具体某个字段的值:',objJ.data.content);
            //       this.objA = Object(objJ.data);
            //     } else {
            //       console.info('error:' + JSON.stringify(err));
            //     }
            //   });

          })
      }
      .alignItems(HorizontalAlign.Center)
      .width('100%')

      //类似一个空行
      Text().height(10);

      Text('id:' + (this.objA.id ? this.objA.id : '')).fontSize(20);
      Text('tag:' + (this.objA.tag ? this.objA.tag : '')).fontSize(20);
      Text('name:' + (this.objA.name ? this.objA.name : '')).fontSize(20);
      Text('origin:' + (this.objA.origin ? this.objA.origin : '')).fontSize(20);
      Text('content:' + (this.objA.content ? this.objA.content : '')).fontSize(20);
      Text('created_at:' + (this.objA.created_at ? this.objA.created_at : '')).fontSize(20);
      Text('updated_at:' + (this.objA.updated_at ? this.objA.updated_at : '')).fontSize(20);
    }
    .alignItems(HorizontalAlign.Start) //配合Column使用HorizontalAlign,默认center
    .width('100%')
    .height('100%')
    .backgroundColor(0xf5f5f5)
  }
}