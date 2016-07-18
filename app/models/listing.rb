class Listing < ActiveRecord::Base
	def index
    @listings = Listing.all
  end
end
