'use strict';
import { PinyinHelper } from './src/PinyinHelper'
import { ChineseHelper } from './src/ChineseHelper'
import { PinyinFormat } from './src/PinyinHelper'


export var pinyin4js = {
    WITH_TONE_MARK      :"WITH_TONE_MARK",   //带声调
    WITHOUT_TONE        :"WITHOUT_TONE",     //不带声调
    WITH_TONE_NUMBER    :"WITH_TONE_NUMBER", //数字代表声调
    FIRST_LETTER        :"FIRST_LETTER",      //首字母风格

    convertToPinyinString: function(str, separator, format) {
        return PinyinHelper.convertToPinyinString(str, separator, format);
    },

    convertToSimplifiedChinese: function(str) {
        return ChineseHelper.convertToSimplifiedChinese(str);
    },

    convertToTraditionalChinese: function(str) {
        return ChineseHelper.convertToTraditionalChinese(str);
    },

    getShortPinyin: function(str) {
        return PinyinHelper.getShortPinyin(str);
    }
}


