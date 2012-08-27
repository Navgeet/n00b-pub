# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#perma_stats').dataTable
    aaSorting: [[ 1, "desc" ]]
    aoColumns: [ null, null, null, null, null, { "sType": "time" } ]
    sPaginationType: "full_numbers"
    bJQueryUI: true