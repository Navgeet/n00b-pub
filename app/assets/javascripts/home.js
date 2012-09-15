$(function () {
    var activeTab = $('[href=' + location.hash + ']');
    activeTab && activeTab.tab('show');
});

$(document).ready(
    function(){
	setInterval(function(){
	    $.ajax({
		url: '/ajax',
		success: function(response){
		    console.log(response);
		}
	    });
	}, 105000);
    });

