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
//= require foundation
//= require turbolinks
//= require ckeditor/init
//= require_tree .

var ready = function(){
  $(document).foundation({
    topbar: {
              sticky_class : 'sticky',
              custom_back_text: false, // Set this to false and it will pull the top level link name as the back text
              is_hover: true,
              mobile_show_parent_link: false, // will copy parent links into dropdowns for mobile navigation
              scrolltop : true // jump to top when sticky nav menu toggle is clicked
            }
  });
  $(document).foundation('abide', 'reflow');
};

$(document).ready(ready)
$(document).on('page:load', ready)