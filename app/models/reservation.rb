class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user

	def reserved_dates
		(self.start_date..self.end_date).to_a
	end
end