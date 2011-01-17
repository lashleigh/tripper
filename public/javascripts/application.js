// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("table.zebra tr:odd").addClass("odd");

  $(".editable_icon").live('click', function() {
    $(this).toggleClass("selected");
  });

  $("#map_address").keyup(function(event){
    if(event.keyCode == 13){
      $("#code_address").click();
    }
  });
  $(".reply").live('click', function() {
    $(this).parents(".comment").find(".reply_form").first().slideToggle('slow');
  });
/*  $( ".reply" ).button({
    icons: {
      primary: "ui-icon-plusthick"
      },
    text: false
  });  

  $( ".destroy_comment" ).button({
    icons: {
      primary: "ui-icon-trash"
      },
    text: false
  });  */
});



