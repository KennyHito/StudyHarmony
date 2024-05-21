import TitleBar from '../../common/TitleBar'

@Entry
@Component
struct DialogPage {
  private sexArray = ["男", "女"];

  build() {
    Column() {
      TitleBar({hasBackPress:true,title:"弹窗组件"});

      //类似一个空行
      Text().height(10);

      //选择类弹窗
      Button("选择类弹窗")
        .fontSize('16fp')
        .width('80%')
        .height('40')
        .backgroundColor('#007DFF')
        .onClick(() => {
          AlertDialog.show({
            message: "我需要支付100元钱吗?",
            primaryButton: {
              value: "不需要",
              action: () => {
                console.log("yhtTest------->:" + "点击了不需要");
              }
            },
            secondaryButton: {
              value: "需要",
              action: () => {
                console.log("yhtTest------->:" + "点击了需要");
              }
            },
            // alignment:DialogAlignment.Bottom,//默认在屏幕的正中间的位置
            // offset:{dx:0,dy:-20}
          })
        })

      //类似一个空行
      Text().height(10);

      //日期选择弹窗
      Button("日期选择弹窗")
        .fontSize('16fp')
        .width('80%')
        .height('40')
        .backgroundColor('#007DFF')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date(),
            selected: new Date('2023-1-1'),
            lunar: false, //是否显示为农历
            onAccept: (value: DatePickerResult) => {
              let year = value.year;
              let month = value.month + 1;
              let day = value.day;
              console.log("yhtTest------->:" + year + "年" + month + "月" + day + "日");
            }
          })
        })

      //类似一个空行
      Text().height(10);

      //文本选择弹窗
      Button("文本选择弹窗")
        .fontSize('16fp')
        .width('80%')
        .height('40')
        .backgroundColor('#007DFF')
        .onClick(() => {
          TextPickerDialog.show({
            range: this.sexArray,
            selected: 0,
            onAccept: (result: TextPickerResult) => {
              console.log("yhtTest------->:" + result.value);
            },
            onCancel: () => {
            }
          })
        })

      //类似一个空行
      Text().height(10);

      //文本选择弹窗
      Button("时间选择弹窗")
        .fontSize('16fp')
        .width('80%')
        .height('40')
        .backgroundColor('#007DFF')
        .onClick(() => {
          TimePickerDialog.show({
            useMilitaryTime: false, //展示时间是否为24小时制
            onAccept: (result: TimePickerResult) => {
              console.log("yhtTest------->:" + JSON.stringify(result));
            },
            onCancel: () => {
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xf5f5f5)
  }
}