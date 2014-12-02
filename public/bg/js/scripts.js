 $(function() {
$( ".slider" ).slider({
value: 0,
min: 0,
max: 30000,
step: 1,
slide: function( event, ui ) {

//$(this).parent().find('input.int').val(  ui.value);
var f = getProcent(ui.value);
$(this).parent().find('input.procent').val(f + '%');
},
create: function( event, ui ) {
	var v = $(this).siblings('input.int').val()
	v =  parseFloat(v)
	$(this).slider( 'value', v);
	
	$(this).siblings('input.procent').val(getProcent(v) + '%');

}
});

$(document).on('keyup', '.string .procent', function(e){
	var n = parseInt($(this).val());
	
	$(this).siblings('.slider').slider('value', parseInt((30000 * n)/100));
	//$(this).siblings('input.int').val(parseInt((30000 * n)/100))
	
	console.log(n)
})

}); 

function getProcent(num) {
	
	var n = (num / 30000) * 100;
	
	
	
	return parseInt(+n);
}
