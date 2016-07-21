class Listing < ActiveRecord::Base
	include ActsAsTaggableOn::TagsHelper
	
	acts_as_taggable_on :tags
	belongs_to :user
end
