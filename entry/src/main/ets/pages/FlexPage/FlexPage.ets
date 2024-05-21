import TitleBar from '../../common/TitleBar'

@Entry
@Component
struct FlexPage {
  build() {
    Column() {
      TitleBar({ hasBackPress: true, title: "网络请求组件" });

      //类似一个空行
      Text().height(10);

      Flex() {
        Text('项目1').basic();
        Text('项目2').basic();
        Text('项目3').basic();
        Text('项目4').basic().flexGrow(2);
        Text('项目5').basic().flexGrow(1);
      }
    }
  }
}

@Styles function basic() {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  .border({ width: 1 })
  .borderColor(Color.Orange)
}