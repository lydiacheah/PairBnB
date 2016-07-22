class ReservationsController < ApplicationController
	def new
		@user = current_user
		@reservation = @user.reservations.new
	end

	def create
		@user = current_user
		@reservation = @user.reservations.new(reservartion_params)

		if @reservation.save 
			redirect_to listing_path, flash:{notice:"Your reservation has been created!"} #'/listings/:id'
		else
			render :new, flash:{notice:"#{@reservation.errors.values.first}"}
		end
	end

	def edit
		if @reservation.update_attributes(reservation_params)
      redirect_to listing_path, flash:{notice:"Your reservation has been updated."}
    else
      redirect_to edit_reservation_path(@reservation)
    end
	end

	def destroy
		
	end

	private

	def reservation_params
	  params.require(:reservation).permit(:start_date, :end_date)
	end

	def set_reservation
		@reservation = Reservation.find(params[:id])
	end
end
