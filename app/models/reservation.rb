class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user
	has_many :transactions

	def reserved_dates
		(self.start_date..self.end_date).to_a
	end

	def paid!
		self.paid = true
		self.save
	end
end