# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#round_stats').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    $('#daily_stats__name').popover()
    $('.popover-with-html').popover({ html : true });
