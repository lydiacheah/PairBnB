class PaymentsController < ApplicationController
  def new
  	@client_token = Braintree::ClientToken.generate
  	@reservation = Reservation.find(params[:format])
  	@payment = Payment.new
  end

  def create
  	@reservation = Reservation.find(params[:payment][:reservation_id]) 
  	@result = Braintree::Transaction.sale(
  		amount: @reservation.listing.price,
  		payment_method_nonce: params[:payment_method_nonce]
  	)
  	if @result.success?
  		@reservation.paid!
  		PaymentMailer.delay.payment_received_email(current_user, @reservation.listing.user, @reservation)
  		Payment.create(user_id: current_user.id, reservation_id: @reservation.id, last_four: @result.transaction.credit_card_details.last_4, ref_no: @result.transaction.id, success: true, amount: @reservation.listing.price)
  		redirect_to listing_path(@reservation.listing.id), flash:{success: "Your payment is successful! The host has been notified of your reservation!"}
  	else
  		Payment.create(user_id: current_user.id, reservation_id: @reservation.id, last_four: @result.transaction.credit_card_details.last_4, ref_no: @result.transaction.id, success: false, amount: @reservation.listing.price)
  		redirect_to new_payment_path(@reservation.id), flash:{danger: "Payment failed. Please try again."}
  	end
  end
end
