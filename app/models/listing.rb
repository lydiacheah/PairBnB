class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :taggings
	has_many :tags, through: :taggings

	mount_uploaders :images, ImageUploader
end
