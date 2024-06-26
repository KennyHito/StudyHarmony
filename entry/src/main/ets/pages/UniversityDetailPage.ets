import router from '@ohos.router'
import { UniversityInfo, universityInfoData } from '../model/UniversityInfo'
import { AdmissionCase, getAdmissionCasesByUniversity } from '../model/AdmissionCases'
import { getMajorInfoByUniversity, MajorInfo } from '../model/MajorInfo'

@Preview
@Entry
@Component
struct UniversityDetailPage {
  @State routerParams:Object = router.getParams()
  @State universityInfo:UniversityInfo = this.routerParams["universityInfo"]
  // @State universityInfo:UniversityInfo = universityInfoData[0] // 测试用
  @State admissionCases:AdmissionCase[] = getAdmissionCasesByUniversity(this.universityInfo["nameCN"])
  @State majorInfo:MajorInfo[] = getMajorInfoByUniversity(this.universityInfo["nameCN"])
  scroller:Scroller = new Scroller()

  build() {
    Column() {
      // 返回图标
      Image($r('app.media.ic_back'))
        .backStyle()
        .alignSelf(ItemAlign.Start)
        .onClick(() => {
          // 返回上一页面
          router.back()
        })

      // header：学校信息
      Row({ space: 25 }) {
        // 校徽
        Image(this.universityInfo.badgeURL)
          .height(70)
          .width(70)
          .borderRadius(5)

        // 学校信息
        Column({ space: 0 }) {
          Text(this.universityInfo.nameCN)
            .height(30)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
          Text(this.universityInfo.nameUS)
            .height(20)
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
          Text("US News排名：" + String(this.universityInfo.usNewsRank))
            .height(20)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
          Text("位置：" + this.universityInfo.location)
            .height(20)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
        } // Column: 学校信息
        .alignItems(HorizontalAlign.Start)
      } // Row
      .alignItems(VerticalAlign.Center)
      .padding(10)
      .width('90%')
      .margin({ top: 5 })
      .borderRadius(10)

      Divider().padding({top: 5})

      List({scroller:this.scroller}) {  // 学校信息列表
        ListItem() {
          Image(this.universityInfo.photoURL)
            .height(200)
            .width(360)
            .borderRadius(10)
            .padding({top: 15})
        }

        ListItem() {
          Column() {
            Text("学校简介")
              .fontWeight(FontWeight.Bold)
              .height(35)

            Text(this.universityInfo.introduction)
              .fontSize(14)
          } // Column: 学校简介
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ top: 5 })
        }

        ListItem() {
          Row() {
            Text("专业设置")
              .fontWeight(FontWeight.Bold)
              .height(35)
            Blank()
            Text("QS排名")
              .fontWeight(FontWeight.Bold)
              .height(35)
          }
          .margin({ top: 5 })
          .width('97%')
        }

        ForEach(this.majorInfo, (majorInfo) => {
          ListItem() {
            MajorInfoItem({ majorInfo: majorInfo })
          }
          .padding({ left:5 })
        })

        ListItem() {
          Text("录取案例")
            .fontWeight(FontWeight.Bold)
            .height(35)
            .margin({ top: 10 })
        }

        ForEach(this.admissionCases, (admissionCase) => {
          ListItem() {
            AdmissionCaseItem({ admissionCase : admissionCase })
          }
          .padding({ left:5 })
        })

        ListItem().height(140).selectable(false)  // 占位符，不然最后一个项目在屏幕外
      } // List
      .width('100%')
      .height('100%')
      .alignListItem(ListItemAlign.Start)
    } // 最外层 Column
    .bgStyle()
  }
}

@Styles function backStyle() {
  .width(25)
  .height(25)
}

@Styles function bgStyle() {
  .width('100%')
  .height('100%')
  .padding({
    top: 30, bottom: 30, left: 20, right: 20
  })
}

// 自定义录取案例组件
// @Preview
@Component
struct AdmissionCaseItem {
  admissionCase:AdmissionCase;

  build() {
    // 录取详情
    Column({ space: 0 }) {
      Text(this.admissionCase.graduateMajor)
        .height(25)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Text("录取年份：" + String(this.admissionCase.admissionYear))
        .height(20)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
      Text("本科院校：" + this.admissionCase.undergraduateUniversity)
        .height(20)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
      Text("本科专业：" + this.admissionCase.undergraduateMajor)
        .height(20)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
    } // Column: 学校信息
    .alignItems(HorizontalAlign.Start)
    .padding(10)
    .width('97%')
    .margin({ top: 10 })
    .borderRadius(10)
    .shadow({ radius: 20 })
    .onClick(()=>{
      router.pushUrl({url:'pages/AdmissionCaseDetailPage',params:{  // 点击学校介绍时，切换到学校详情页面
        admissionCase:this.admissionCase
      }})
    })  // onClick
  } // build
}

// 自定义专业信息组件
// @Preview
@Component
struct MajorInfoItem {
  majorInfo:MajorInfo

  build() {
    // 录取详情
    Row() {
      Text(this.majorInfo.name)
      Blank()
      Text(String(this.majorInfo.qsRank))
    }
    .width('97%')
    .padding(10)
    .margin({ top: 10 })
    .borderRadius(7)
    .shadow({ radius: 20 })
    .onClick(()=>{
      router.pushUrl({url:'pages/MajorDetailPage',params:{  // 点击学校介绍时，切换到学校详情页面
        majorInfo:this.majorInfo
      }})
    })  // onClick
  } // build
}