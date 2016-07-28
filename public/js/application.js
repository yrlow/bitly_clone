$(document).ready(function(){
	// insert javascript code within here
	// $("#header").click(function(){
	// 	$("#header").hide();
	// });
	$("table").click(function(){
		$("table").css("visibility", "hidden");
	});
	// body is html class and .hide() is javascript code
	$("form").on('submit', function(e){
		e.preventDefault(); 
		// dont go into controller by default
		$.ajax({
			type: "post",
			data: $(this).serialize(),
			url: "/urls",
			dataType: "json",
			success: function(data){
				if ( data.short_url == undefined ) {
					$('#error').text( data[0] )
				} else {
					$('table tr:first').after('<tr class="new" ><td>' + data.id + '</td><td>' + data.long_url +'</td><td><a href="' + data.short_url +'">' + data.short_url + '</a></td><td>' + data.click_count +'</td></tr>');
				}
			}
		});
	});

});