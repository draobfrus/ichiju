import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

export default class extends Controller {
  connect() {
    new TomSelect('#select',{
      plugins: {
        remove_button: {
        }
      },
      onItemAdd:function(){
        this.setTextboxValue('');
        this.refreshOptions();
      },
      persist: false,
      create: false,
    });
  }
}
