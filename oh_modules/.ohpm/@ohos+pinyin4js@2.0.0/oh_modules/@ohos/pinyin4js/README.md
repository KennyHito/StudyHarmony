# pinyin4js

## 简介

适配了OpenHarmony的一款汉字转拼音的Javascript开源库，包含如下特性:

* **零依赖**

* **词库灵活导入,打包**   
  可以自行调整字典，具体可以参照src/dict；所有资源调用由PinyinResource封装，可自行修改后打包

* **准确、完善的字库**  
  Unicode编码从4E00-9FA5范围及3007（〇）的20903个汉字中，pinyin4js能转换除46个异体字（异体字不存在标准拼音）之外的所有汉字

* **拼音转换速度快**  
  经测试，从4E00-9FA5范围的20902个汉字，pinyin4js耗时约110毫秒

* **多拼音格式输出支持**  
  支持多种拼音输出格式：带音标、不带音标、数字表示音标以及拼音首字母输出格式

* **常见多音字识别**  
  支持常见多音字的识别，其中包括词组、成语、地名等

* **简繁体中文转换**

* **支持添加自定义字典**  
  支持添加用户自定义字典

## 下载安装
```
ohpm install @ohos/pinyin4js
```

## 使用说明

```javascript
    import {pinyin4js} from '@ohos/pinyin4js';

    // more detail methods in test
    // WITH_TONE_NUMBER--数字代表声调，WITHOUT_TONE--不带声调，WITH_TONE_MARK--带声调
    // output: xià#mén#nǐ#hǎo#dà#shà#xià#mén
    console.info("00771-" + pinyin4js.convertToPinyinString('校对', '#', pinyin4js.WITH_TONE_MARK));
    console.info("00771-" + pinyin4js.convertToPinyinString('學校', '#', pinyin4js.WITH_TONE_MARK));
    console.info("00772-" + pinyin4js.convertToPinyinString('厦门你好大厦厦门', '#', pinyin4js.WITHOUT_TONE));
    
    // 首字母风格
    // output: xmnhdsxm
    console.info("00773-" + pinyin4js.convertToPinyinString('厦门你好大厦厦门', '', pinyin4js.FIRST_LETTER));
    // or
    console.info("00774-" + pinyin4js.getShortPinyin('厦门你好大厦厦门'));
    
    // 繁体转简体
    console.info("00775-" + pinyin4js.convertToSimplifiedChinese('歲月時光'));
    // 简体转繁体
    console.info("00776-" + pinyin4js.convertToTraditionalChinese('岁月时光'));
    
```

## 约束与限制

在下述版本验证通过：

DevEco Studio版本: 4.0Canary1(4.0.3.212), SDK: API10(4.0.8.3)

## 贡献代码
使用过程中发现任何问题都可以提 [Issue](https://gitee.com/openharmony-tpc/pinyin4js/issues) 给我们，当然，我们也非常欢迎你给我们发 [PR](https://gitee.com/openharmony-tpc/pinyin4js/pulls) 。

## 开源协议
本项目基于 [MIT License](https://gitee.com/openharmony-tpc/pinyin4js/blob/master/LICENSE) ，请自由地享受和参与开源。