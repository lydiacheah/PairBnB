class UsersController < Clearance::UsersController
  before_action :set_user, only: [:create, :show, :edit, :update, :destroy]

	def edit
	end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def show
  end

	private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :gender, :avatar)
  end
 end