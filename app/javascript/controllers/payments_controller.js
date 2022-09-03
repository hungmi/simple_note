import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "minDate", "maxDate" ]
	connect() {
		document.querySelector("#js-admin-payments-pagy input[type='number']").addEventListener("change", function(e) {
			if (parseInt(e.target.value) > 0) {
				if (window.location.href.indexOf("page") > -1) {
					window.location.href = window.location.href.replace(/(page=)\d+/, `$1${e.target.value}`)
				} else {
					if (window.location.href.indexOf("?") > -1) {
						window.location.href += `&page=${e.target.value}`
					} else {
						window.location.href += `?page=${e.target.value}`
					}
				}
			}
		})
	}
  	setDateFilter(e) {
  		var controller = this
  		this.minDateTarget.value = e.target.value
  	}
}