// エラー解消のため一時的にコメントアウト
// import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
