$(function(){
	var maxNum = 1000000; 
	var tagFeeOutput = $('.li-right-fee'); 
  var tagPrifitOutput = $('.li-right-profit'); 

  function buildFeeHTML(feePrice){
    var html = `${feePrice} 円`
    return html;
  }

  function buildPrifitHTML(prifitPrice){
    var html = `${prifitPrice} 円`
    return html;
  }

	$('.input-price').on('keyup', function(e) {
    e.preventDefault();
    tagFeeOutput.empty(); 
    tagPrifitOutput.empty(); 
    var str = $(this).val();
    var num = Number(str.replace(/[^0-9]|[^\x01-\x7E\xA1-\xDF]/g, '')); 

		if(num == 0) {
      num = '';
		} else if (num > maxNum) { 
      num = '';
		} 
    $(this).val(num);
    if(num != 0) {
      var feePrice = Math.round(num * 0.8);
      var prifitPrice = num - feePrice;
      var feeHTML = buildFeeHTML(feePrice);
      var prifitHTML = buildPrifitHTML(prifitPrice);
      tagFeeOutput.append(feeHTML);
      tagPrifitOutput.append(prifitHTML);
    }
	});
});
