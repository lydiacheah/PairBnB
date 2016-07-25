class ReservationMailer < ApplicationMailer
	default from: "bearbnb.welcome@gmail.com"

	def booking_email(customer, host, reservation)
		@customer = customer
		@host = host
		@reservation = reservation	
		mail(to: @host.email, subject: "Your listing has received a booking!")
	end
end
