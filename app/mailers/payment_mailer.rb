class PaymentMailer < ApplicationMailer
	default from: "bearbnb.welcome@gmail.com"

	def payment_received_email(customer, host, reservation)
		@customer = customer
		@host = host
		@reservation = reservation	
		mail(to: @host.email, subject: "You've received payment!")
	end
end
