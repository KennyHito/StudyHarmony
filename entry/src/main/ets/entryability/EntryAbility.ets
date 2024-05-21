import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import PreferencesUtil from '../common/PreferencesUtil'

export default class EntryAbility extends UIAbility {

  onCreate(want, launchParam) {
    console.log('yhtTest------->:' + 'Ability生命周期回调，Ability启动时被调用。');

    ///本地持久化数据学习
    PreferencesUtil.createFontPreferences(this.context);//必须需要初始化
    PreferencesUtil.saveDefaultFontSize(299);// 设置字体默认大小
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log('yhtTest------->:' + 'Ability生命周期回调，创建window stage时被调用，应用开发者可通过window.WindowStage的接口执行页面加载等操作。');
    //⚠️app启动程序入口 pages/Index
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        return;
      }
    });
  }

  onWindowStageDestroy() {
    console.log('yhtTest------->:' + 'Ability生命周期回调，销毁window stage时被调用。');
  }

  onForeground() {
    console.log('yhtTest------->:' + 'Ability生命周期回调，Ability切换至前台时被调用。');
  }

  onBackground() {
    console.log('yhtTest------->:' + 'Ability生命周期回调，Ability切换至后台时被调用。');
  }

  onDestroy() {
    console.log('yhtTest------->:' + 'Ability生命周期回调，Ability销毁时被调用。');
  }
}
