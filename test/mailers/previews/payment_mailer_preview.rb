# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview
	def payment_received_email
		PaymentMailer.payment_received_email(User.first, User.last, Reservation.first)
	end
end
