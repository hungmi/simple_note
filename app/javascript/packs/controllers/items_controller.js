import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "item" ]

  // connect() {
  //   console.log("Hello, Stimulus!", this.element)
  // }

  alert(e) {
  	e.preventDefault()
  	console.log(this.itemTarget.innerHTML)
  }

  removeItem(e) {
  	e.preventDefault()
  	// const element = this.nameTarget
  	//  const name = element.value
  	this.itemTarget.style.display = 'none'
  }

  // load() {
  //   fetch(this.data.get("url"))
  //     .then(response => response.text())
  //     .then(html => {
  //       this.element.innerHTML = html
  //     })
  // }

  // disconnect() {
  //  // this.someFunction()
  // }

  // someFunction() {
  // 	// do something
  // }

  // get name() {
  // 	return this.data.get("name")
  // }

  // set name(value) {
  // 	this.data.set("name", value)
  // }
}