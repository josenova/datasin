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
//= require jquery_ujs
// require turbolinks
//= require_tree .


$( document ).ready(function() {


    $('.print').click(function() {
  		window.print();
  		return false;
 		});
 		
 		$('#settings').click(function () {
	  	$('#pop_menu').show();
   	});

		$(document).mouseup(function() {
	  	$("#pop_menu").hide();
   	});
   	
   	if ($('#notice').length == 1) {
      $('#notice').delay(2000).fadeOut('fast');
    }
     
    if ($('.page[unactive="false"]').length == 2) {
      $('#vehicle_report').hide();
    }
    
    $('#vehicle_icon a').click(function() {
      $('#client_report').hide();
      $('#company_report').hide();
      $('#vehicle_report').show();
    });
    
    $('#client_icon a').click(function() {
      $('#vehicle_report').hide();
      $('#client_report').show();
      $('#company_report').show();
    });
    
    
    $('#new_user').submit(function (e) {
    var form = this;
    e.preventDefault();
    $('#sign_in input[type="submit"]').css({'font-size' : '0px', 'background-size' : '200%'});
    setTimeout(function () {
        form.submit();
    }, 1500); // in milliseconds
});
    
    
 		
 		
});

