class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]

	def index
		@listings = Listing.all
	end

	def search
		@listings = Listing.search(params[:search])
	end

	def new
		@user = current_user
		@listing = @user.listings.new # make it an empty object its not a nil class
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
		@tag_list = params[:listing][:tags][:name].downcase
		@tag_list = @tag_list.split(",")
		@tag_list.each do |word|
			word.gsub!(/[^0-9A-Za-z-]/, "")
		end

		@tag_list.uniq.each do |tag|
			@listing.tags << Tag.find_or_create_by(name: tag)
		end

		if @listing.save 
			redirect_to @listing, flash:{success:"Your listing has been created!"} #'/listings/:id'
				# redirect_to listing_piath(@listing)
		else
			render :new, flash:{danger:"#{@listing.errors.values.first}"}
				# render 'new' #app/views/listings/new.html.erb
		end
	end


	def show #'listings/:id'
		@reservation = current_user.reservations.find_by(listing_id: @listing.id)
	end

	def update
		if @listing.update_attributes(listing_params)
      redirect_to @listing, flash:{success: "Your listing has been successfully updated."}
    else
      redirect_to edit_listing_path(@listing), flash:{danger: @listing.errors.values.first}
    end
	end

	def destroy
		if @listing.exists? 
			@listing.destroy
			redirect_to listings_path, flash:{success: "Your listing has been successfully deleted."}
		else
			redirect_to listings_path, flash:{danger: "The listing doesn't exist."}
		end
	end

	private

	def listing_params
	  params.require(:listing).permit(:name, :address, :city, :country, :property_type, :people_number, :bathroom_number, :bedroom_number, :price, {images: []})
	end	

	def set_listing
		@listing = Listing.find(params[:id])
	end
end
