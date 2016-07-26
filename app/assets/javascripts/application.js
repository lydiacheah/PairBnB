// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require moment
//= require daterangepicker

$(document).ready(function() {
	$('.sign-in-button').click(function() {
		$('.background').fadeIn();
		$('.box').fadeOut(200);
		$('.box').fadeOut(function() {
			$('.sign-up-form').hide();
			$('.box').fadeIn(800);
			$('.sign-in-form').fadeIn(700);	
		});	
	});

	$('.sign-up-button').click(function() {
				$('.background').fadeIn();
		$('.box').fadeOut(200);
		$('.box').fadeOut(function() {
			$('.sign-in-form').hide();
			$('.box').fadeIn(800);
			$('.sign-up-form').fadeIn(700);
		});
	});

	$('.cancel').click(function() {
		$('.box').fadeOut(200);
		$('.box').fadeOut(function() {
			$('.sign-in-form').hide(200);
			$('.sign-up-form').hide(200);
			$('.background').fadeOut();		
		});	
	});

	$('#sign-in-button').click(function() {
		$('.box').fadeOut(200);
		$('.box').fadeOut(function() {
			$('.sign-in-form').hide(200);
			$('.sign-up-form').show(200);		
		});	
	});

	$('.background').click(function() {
		$('.background').fadeOut();
		$('.box').fadeOut();
	});
});