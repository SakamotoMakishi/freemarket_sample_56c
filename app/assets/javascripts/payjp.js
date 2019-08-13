$(document).on('turbolinks:load', function() {
  Payjp.setPublicKey('pk_test_27b237ae87812703d62d535e');

  $("#charge-form").on("click", "#card_token", function(e) {
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
        $("#charge-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
        $("#charge-form").get(0).submit();
      }
    });
  });
});


