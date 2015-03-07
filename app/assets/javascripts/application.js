// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

	$( "#login a" ).on( "click", function(event) {
	  event.preventDefault();
	  var login_form = $('.login_form')
	  login_form.show();
	  });

// change recipe submit button to 'Update'

  $(".edit-recipe-form input[type='submit']").val('Update')

// show edit recipe form on click

  $( "#edit a" ).on( "click", function(event) {
  event.preventDefault();
  var edit_recipe_form = $('.edit-recipe-form')
  edit_recipe_form.show();
  });



});

