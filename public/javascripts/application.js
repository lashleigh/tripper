// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("table.zebra tr:odd").addClass("odd");

  $(".icon").live('click', function() {
    $(this).toggleClass("selected");
  });
});



