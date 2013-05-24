// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function (){

	var key = $('meta[name=stripe-key]').attr('content');
	Stripe.setPublishableKey(key);

	function setupForm () {
		$('#new_order').on('submit', function () {

			$('input[type=submit]').attr('disable', true);

			if ($('#card_number').length > 0) {
				processCard();
				return false;
			} else {
				return true;
			}

		});
	}

	function processCard() {
		Stripe.createToken({
			number: $('#card_number').val(),
			cvc: $('#card_code').val(),
			expMonth: $('#card_month').val(),
			expYear: $('#card_year').val()
		}, handleStripeResponse);
	}

	function handleStripeResponse(status, response) {
		if (status == 200) {
			$('#order_stripe_card_token').val(response.id);
			$('#new_order')[0].submit();
		} else {
			alert(response.error.message);
		}
	}

	setupForm();



});