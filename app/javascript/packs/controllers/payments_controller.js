// <div data-controller="hello" data-hello-name="8888">
//   <input data-target="hello.name" type="text">
//   <button data-action="click->hello#greet">Greet</button>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "minDate", "maxDate" ]
  	setDateFilter(e) {
  		var controller = this
  		this.minDateTarget.value = e.target.value
  	}
}