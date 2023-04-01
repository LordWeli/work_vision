class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = Users::Create.new(user_params).creator

    return render :new unless @user.valid?

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :confirm_password)
  end
end
