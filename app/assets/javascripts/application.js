// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// Set the JS call order here, as often important.
// e.g. turbolinks known to cause bugs, so include our html5sortable code explicitly

// Note, can't have comments after //= require statements  // such as this :-( !!!!

// Have set explicity order for load here

//= require jquery3    
//= require bootstrap-sprockets    
//= require bootstrap    
//= require rails-ujs
//= require jquery-ui
//= require html5sortable
//= require popper
//= require turbolinks
//= require activestorage

// gets all other .js in this folder ??  // so should bring in our html5sortable.js source
//= require_tree .