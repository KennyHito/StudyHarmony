import Study from "../view/Study"
import list from "../view/List"
import Grid from "../view/Grid"

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Study();
      }
      .tabBar(this.TabBuilder('学习', 0, $r('app.media.ic_movie_one'), $r('app.media.ic_movie_one')))

      TabContent() {
        list();
      }
      .tabBar(this.TabBuilder('列表', 1, $r('app.media.ic_movie_two'), $r('app.media.ic_movie_two')))

      TabContent() {
        Grid();
      }
      .tabBar(this.TabBuilder('网格', 2, $r('app.media.ic_movie_three'), $r('app.media.ic_movie_three')))

    }
    .barWidth('100%')
    .barHeight(50)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}