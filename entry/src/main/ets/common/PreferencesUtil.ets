import dataPreferences from '@ohos.data.preferences';
import { GlobalContext } from './GlobalContext';

const TAG = '[PreferencesUtil]';
const PREFERENCES_NAME = 'myPreferences';
const KEY_APP_FONT_SIZE = 'appFontSize';

/**
 * The PreferencesUtil provides preferences of create, save and query.
 */
export class PreferencesUtil {
  createFontPreferences(context: Context) {
    let fontPreferences: Function = (() => {
      let preferences: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(context,
        PREFERENCES_NAME);
      return preferences;
    });
    GlobalContext.getContext().setObject('getFontPreferences', fontPreferences);
  }

  saveDefaultFontSize(fontSize: number) {
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function;
    getFontPreferences().then((preferences: dataPreferences.Preferences) => {
      preferences.has(KEY_APP_FONT_SIZE).then(async (isExist: boolean) => {
        console.info(TAG, 'preferences has changeFontSize is ' + isExist);
        if (!isExist) {
          await preferences.put(KEY_APP_FONT_SIZE, fontSize);
          preferences.flush();
        }
      }).catch((err: Error) => {
        console.error(TAG, 'Has the value failed with err: ' + err);
      });
    }).catch((err: Error) => {
      console.error(TAG, 'Get the preferences failed, err: ' + err);
    });
  }

  saveChangeFontSize(fontSize: number) {
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function;
    getFontPreferences().then(async (preferences: dataPreferences.Preferences) => {
      await preferences.put(KEY_APP_FONT_SIZE, fontSize);
      preferences.flush();
    }).catch((err: Error) => {
      console.error(TAG, 'put the preferences failed, err: ' + err);
    });
  }

  async getChangeFontSize() {
    let fontSize: number = 0;
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function;
    fontSize = await (await getFontPreferences()).get(KEY_APP_FONT_SIZE, fontSize);
    return fontSize;
  }

  async deleteChangeFontSize() {
    let getFontPreferences: Function = GlobalContext.getContext().getObject('getFontPreferences') as Function;
    const preferences: dataPreferences.Preferences = await getFontPreferences();
    let deleteValue = preferences.delete(KEY_APP_FONT_SIZE);
    deleteValue.then(() => {
      console.info(TAG, 'Succeeded in deleting the key appFontSize.');
    }).catch((err: Error) => {
      console.error(TAG, 'Failed to delete the key appFontSize. Cause: ' + err);
    });
  }
}

export default new PreferencesUtil();