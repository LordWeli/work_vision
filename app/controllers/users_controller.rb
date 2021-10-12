class UsersController < AuthorizationController
  before_action :set_user, only: %i[show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    return if params[:user].blank?

    params.require(:user).permit(:email, :password, :confirm_password)
  end
end
