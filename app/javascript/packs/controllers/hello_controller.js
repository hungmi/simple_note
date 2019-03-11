// <div data-controller="hello" data-hello-name="8888">
//   <input data-target="hello.name" type="text">
//   <button data-action="click->hello#greet">Greet</button>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "name" ]

  // connect() {
  //   console.log("Hello, Stimulus!", this.element)
  // }

  greet() {
  	// const element = this.nameTarget
  	//  const name = element.value
  	console.log(`Hello!, ${this.nameTarget.value}!`)
  	this.name = this.nameTarget.value
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

  get name() {
  	return this.data.get("name")
  }

  set name(value) {
  	this.data.set("name", value)
  }
}