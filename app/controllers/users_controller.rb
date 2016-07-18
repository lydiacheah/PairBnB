class UsersController < Clearance::UsersController
	def edit
		@user = current_user
	end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # byebug
      redirect_to user_path

    else
      render 'edit'
    end
  end

  def show
  	@user = current_user
  end

	private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :gender)
  end
 end