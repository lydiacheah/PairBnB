class UsersController < Clearance::UsersController
  before_action :set_user, only: [:create, :show, :edit, :update, :destroy, :user_listings]

	def edit
    if @user == current_user 
      redirect_to edit_user_path(@user)
    else
      redirect_to listings_path, flash:{danger: "You are not authorized to view that page."}
    end
	end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, flash:{success: "Your profile has been successfully updated."}
    else
     redirect_to edit_user_path(@user), flash:{danger: @user.errors.values.first}
    end
  end

  def show
  end

  def destroy
    
  end

  def user_listings
  end

  def user_reservations
    @user = current_user
  end

	private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :gender, :avatar)
  end
 end