document.addEventListener(
  "DOMContentLoaded", (e) => {
  Payjp.setPublicKey('pk_test_1a7ddd0604bfefd35eaac84a');

  $("#charge-form").on("click", function(e) {
    e.preventDefault();
    var card = {
        number: parseInt($("#card_number").val()),
        cvc: parseInt($("#cvc").val()),
        exp_month: parseInt($("#exp_month").val()),
        exp_year: parseInt($("#exp_year").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("カード情報が正しくありません。"); 
      }
      else {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); 

        var token = response.id;
        $("#charge-form").append(
        $('<input type="hidden" name="token" class="payjp-token" />').val(token));
        document.inputForm.submit();
        }
    });
  });
},false);



