import promptAction from '@ohos.promptAction';
import PreferencesUtil from '../common/PreferencesUtil'
import notification from '@ohos.notificationManager';
import wantAgent from '@ohos.app.ability.wantAgent';
import { pinyin4js } from '@ohos/pinyin4js';

@Component
export default struct Study {
  @State message: string = 'Hello World';
  @State phone: string = '';
  @State password: string = '';
  @State localNum: number = 0;
  @State positionText: string = '';
  @State text: string = '1234567';
  @State mylist: boolean | number | string  = '100';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        //文本
        Text(this.message)
          .fontSize(20) //文字字号
          .fontWeight(FontWeight.Bold) //文字字重
          .fontColor(Color.Red) //文字颜色
          .opacity(1) //文字透明度
          .decoration({ type: TextDecorationType.LineThrough }) //文字增加分割线
        Text('HarmonyOS')
          .fontColor(Color.Blue)
          .fontSize(20)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')
          .textAlign(TextAlign.Start)

        //类似一个空行
        // Text().height(10);

        //分割线
        Divider();

        //输入框
        TextInput({ placeholder: "请输入手机号码" })
          .placeholderColor(0x999999)
          .placeholderFont({ size: 20, weight: FontWeight.Medium, family: 'cursive', style: FontStyle.Italic })
          .maxLength(11)
          .fontColor(Color.Blue)
          .fontSize(20)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')
          .type(InputType.Number)
          .onChange((value: string) => {
            this.phone = value;
            console.log('yhtTest------->:' + value);
          })
        Text("手机号:" + this.phone)
        TextInput({ placeholder: '请输入密码' })
          .placeholderColor(0x999999)
          .placeholderFont({ size: 20, weight: FontWeight.Medium, family: 'cursive', style: FontStyle.Italic })
          .maxLength(11)
          .fontColor(Color.Blue)
          .fontSize(20)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')
          .type(InputType.Password)
          .onChange((value: string) => {
            this.password = value;
            console.log('yhtTest------->:' + value);
          })
        Text("密码:" + this.password)
        Button("登录/注册")
          .fontSize('16fp')
          .width('90%')
          .height('40')
          .backgroundColor('#007DFF')
          .onClick(() => {
            let mes = '';
            if (this.phone === '' || this.password === '') {
              mes = '手机号或密码不能为空!';
            } else {
              mes = '登录成功!';
            }
            promptAction.showToast({
              message: mes,
              duration: 3000,
              bottom: 300
            });
          })

        //类似一个空行
        Text().height(10);

        //Row
        Row({ space: 200 }) {
          Text("短信验证码登录").onClick(() => {
            console.log('yhtTest------->:' + '短信验证码登录');
          })
          Text("忘记密码").onClick(() => {
            console.log('yhtTest------->:' + '忘记密码');
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('90%')
        .backgroundColor(Color.Gray)
        .alignItems(VerticalAlign.Center) //配合Row使用VerticalAlign,默认center
        .height(30)

        //类似一个空行
        Text().height(10);

        // LoadingProgress组件用于显示加载进展，
        // 比如应用的登录界面，当我们点击登录的时候，显示的“正在登录”的进度条状态。
        // LoadingProgress的使用非常简单，只需要设置颜色和宽高就可以了。
        LoadingProgress()
          .color(Color.Blue)
          .height(60)
          .width(60)

        //类似一个空行
        Text().height(10);

        /// 本地持久化数据
        Text('本地持久化数据');
        Row() {
          Button("获取")
            .fontSize('16fp')
            .height('40')
            .backgroundColor('#007DFF')
            .onClick(() => {
              // 数据持久化
              PreferencesUtil.getChangeFontSize().then((value) => {
                console.log('yhtTest------->:' + 'value:', value);
                this.localNum = value;
              });
            })

          Button("更新")
            .fontSize('16fp')
            .height('40')
            .backgroundColor('#007DFF')
            .onClick(() => {
              // 数据持久化
              PreferencesUtil.saveChangeFontSize(666);
            })

          Button("删除")
            .fontSize('16fp')
            .height('40')
            .backgroundColor('#007DFF')
            .onClick(() => {
              // 数据持久化
              PreferencesUtil.deleteChangeFontSize();
            })
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('100%')

        Text(this.localNum.toString());

        //类似一个空行
        Text().height(10);

        Button("发送一条通知")
          .fontSize('16fp')
          .width('90%')
          .height('40')
          .backgroundColor('#007DFF')
          .onClick(() => {
            promptAction.showToast({
              message: "不好意思,还在开发中...",
              duration: 3000,
              bottom: 300
            });
          })

        //类似一个空行
        Text().height(10);

        Button("使用三方组件")
          .fontSize('16fp')
          .width('90%')
          .height('40')
          .backgroundColor('#007DFF')
          .onClick(() => {

            // more detail methods in test
            // WITH_TONE_NUMBER--数字代表声调，WITHOUT_TONE--不带声调，WITH_TONE_MARK--带声调
            // output: xià#mén#nǐ#hǎo#dà#shà#xià#mén
            console.info("yhtTest------->:<<简体转拼音,并带声调>>" + pinyin4js.convertToPinyinString('校对', '#', pinyin4js.WITH_TONE_MARK));
            console.info("yhtTest------->:<<繁体转拼音,并带声调>>" + pinyin4js.convertToPinyinString('學校', '#', pinyin4js.WITH_TONE_MARK));
            console.info("yhtTest------->:<<汉字转拼音,并带不声调>>" + pinyin4js.convertToPinyinString('厦门你好大厦厦门', '#', pinyin4js.WITHOUT_TONE));

            // 首字母风格
            // output: xmnhdsxm
            console.info("yhtTest------->:<<汉字首字母>>" + pinyin4js.convertToPinyinString('厦门你好大厦厦门', '', pinyin4js.FIRST_LETTER));
            // or
            console.info("yhtTest------->:<<汉字首字母>>" + pinyin4js.getShortPinyin('厦门你好大厦厦门'));

            // 繁体转简体
            console.info("yhtTest------->:<<繁体转简体>>" + pinyin4js.convertToSimplifiedChinese('歲月時光'));
            // 简体转繁体
            console.info("yhtTest------->:<<简体转繁体>>" + pinyin4js.convertToTraditionalChinese('岁月时光'));
          })

        //类似一个空行
        Text().height(10);

        Button('小按钮').width(100).height(40)
          .onClick((event: ClickEvent) => {
            this.positionText = 'Click Point:' + '\nscreenX:' + event.screenX + '\nscreenY:' + event.screenY
            + '\nx:' + event.x + '\ny:' + event.y + '\ntarget:' + '\ncomponent globalPos:('
            + event.target.area.globalPosition.x + ',' + event.target.area.globalPosition.y + ')\nwidth:'
            + event.target.area.width + '\nheight:' + event.target.area.height + '\ntimestamp:' + event.timestamp;
          })

        Button('大按钮').width(200).height(50)
          .onClick((event: ClickEvent) => {
            this.positionText = 'Click Point:' + '\nscreenX:' + event.screenX + '\nscreenY:' + event.screenY
            + '\nx:' + event.x + '\ny:' + event.y + '\ntarget:' + '\ncomponent globalPos:('
            + event.target.area.globalPosition.x + ',' + event.target.area.globalPosition.y + ')\nwidth:'
            + event.target.area.width + '\nheight:' + event.target.area.height + '\ntimestamp:' + event.timestamp;
          })

        Text(this.positionText).margin(15);

        Button('switch按钮').width(200).height(50).onClick((event: ClickEvent) => {
          console.log('yhtTest------->:switch按钮被触发!');
          switch (this.localNum){
            case 666:
              console.log('yhtTest------->:'+this.localNum);
              break
            default :
              console.log('yhtTest------->:'+this.localNum);
              break
          }
        })

        Button('按钮点击事件另一种写法').width(200).height(50).onClick(this.handClick.bind(this))
        Text(this.text)
      }
      .alignItems(HorizontalAlign.Center) //配合Column使用HorizontalAlign,默认center
      .backgroundColor(0xF1F3F5)
      .width('100%')
      // .height('100%')//Scroll组件不要设置height,否则不会滚动
      .padding(10)
    }
  }

  handClick(){
    this.text = 'abcdefg'//⚠️使用this去处理内容时候,必须采用handClick.bind调用,否则会找不到this
    console.log('yhtTest------->:'+'按钮点击事件另一种写法');
  }
}