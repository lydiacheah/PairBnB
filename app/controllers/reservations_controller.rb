class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:index, :edit, :destroy]

	def index
		@listing = @reservation.listing
	end

	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = @listing.reservations.new
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		if (@reservation.reserved_dates & @listing.blocked_dates).empty?
			@reservation.listing_id = @listing.id
			if @reservation.save
				ReservationMailer.delay.booking_email(current_user, @listing.user, @reservation)
				redirect_to listing_path(params[:listing_id]), flash:{success:"Your reservation has been created!"} #'/listings/:id'
			else
				redirect_to new_listing_reservation_path(params[:listing_id]), flash:{danger:"#{@reservation.errors.values.first}"}
			end
		else
			flash[:danger] = 'There is already a reservation made for those dates.'
			respond_to do |format|
				format.html { redirect_to new_listing_reservation_path(params[:listing_id]), flash:{danger: "There is already a reservation made for those dates."} }
 				format.js
 			end 
		end
	end

	def edit
		if @reservation.update_attributes(reservation_params)
      redirect_to listing_path(params[:listing_id]), flash:{success:"Your reservation has been updated."}
    else
      redirect_to edit_reservation_path(@reservation), flash:{danger: @reservation.errors.values.first}
    end
	end

	def destroy
		if @reservation.exists? 
			@reservation.destroy
			redirect_to listing_path, flash:{success: "Your reservation has been successfully deleted."}
		else
			redirect_to @reservation, flash:{danger: "The reservation doesn't exist."}
		end
	end

	private

	def reservation_params
	  params.require(:reservation).permit(:start_date, :end_date, :comment)
	end

	def set_reservation
		@reservation = Reservation.find(params[:id])
	end
end
