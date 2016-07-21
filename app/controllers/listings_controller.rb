class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]

	def index
		@listings = Listing.all	
	end

	def new
		@user = current_user
		@listing = @user.listings.new # make it an empty object its not a nil clas
		# render 'new'
	end

	def create
		@user = current_user
		@listing = @user.listings.new(listing_params)
		# respond_to do |format|
		# 	if @listing.save 
		# 		format.html{redirect_to @listing, flash:{notice:"dsad"}} #'/listings/:id'
		# 		# redirect_to listing_path(@listing)
		# 	else
		# 		format.html{render :new, flash:{notice:"#{@listing.errors.full_messages}"}}
		# 		# format.json{render json:}
		# 		# render 'new' #app/views/listings/new.html.erb
		# 	end
		# end	

		if @listing.save 
			redirect_to @listing, flash:{notice:"Your listing has been created!"} #'/listings/:id'
				# redirect_to listing_path(@listing)
		else
			render :new, flash:{notice:"#{@listing.errors.values.first}"}
				# render 'new' #app/views/listings/new.html.erb
		end
	end


	def show
	end

	def update
		if @listing.update_attributes(listing_params)
      redirect_to @listing
    else
      redirect_to edit_listing_path(@listing)
    end
	end

	private

	def listing_params
	  params.require(:listing).permit(:name, :address, :city, :country, :property_type, :people_number, :bathroom_number, :bedroom_number)
	end	

	def set_listing
		@listing = Listing.find(params[:id])
	end
end
