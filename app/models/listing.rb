class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, dependent: :destroy
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings

	mount_uploaders :images, ImageUploader

	# validates :price, presence: {message: "Please enter a price value."}

	def blocked_dates
		dates = []
		self.reservations.each do |r|
			r.reserved_dates.each do |d| 
				dates << d 
			end
		end
		return dates
	end
end
