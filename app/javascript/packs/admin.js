// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap/dist/js/bootstrap'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

require("trix")
require("@rails/actiontext")

import "timeago"

document.addEventListener("turbolinks:load", function() {
	$("form#payment_search input[type='text'], form#payment_search select").on("change", function() {
		if (!$("form#payment_search").hasClass("submitting")) {
			$("form#payment_search").addClass("submitting")
			$("form#payment_search").submit()
		}
	})
	$("form#payment_search input[type='date']").on("blur", function() {
		if (!$("form#payment_search").hasClass("submitting")) {
			$("form#payment_search").addClass("submitting")
			$("form#payment_search").submit()
		}
	})
	$("form#payment_search label").on("click", function() {
		if (!$("form#payment_search").hasClass("submitting")) {
			$(this).find("input[type='radio']").prop("checked", !$(this).find("input[type='radio']").prop("checked"))
			$("form#payment_search").addClass("submitting")
			$("form#payment_search").submit()
		}
	})
	$(".btn-group-toggle label").on("click", function() {
		$(this).parents(".btn-group-toggle").find("label").addClass("btn-secondary").removeClass("btn-primary")
		$(this).removeClass("btn-secondary").addClass("btn-primary")
	})
})