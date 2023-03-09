import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {
  static targets = ["menu", "content"]

  menuClick(event){
    const menus = this.menuTargets //メニューバー全体
    const current = event.currentTarget //クリックしたメニューバーの要素（現在地）
    const currentIndex = menus.indexOf(current) //クリックしたメニューバーのインデックス番号
    const contents = this.contentTargets //コンテンツ全体の要素

    menus.forEach((menu, index) => { //初期化
      if (current.classList.contains("not-active")) {
        menu.classList.remove("tab-active")
        menu.classList.add("not-active")
        contents[index].classList.add("hidden")
      }
    })

    if(current.classList.contains("not-active")){ //クリックしたメニューのclassをアクティブにする
      current.classList.remove("not-active")
      current.classList.add("tab-active")
      contents[currentIndex].classList.remove("hidden") //クリックした要素のコンテンツを表示する
    }
  }
}
