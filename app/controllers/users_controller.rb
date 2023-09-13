class UsersController < ApplicationController
  def create
    user = Users::Create.new(user_params).creator

    serializable_user = UserSerializer.new(user).serializable_hash

    render json: serializable_user, status: :ok
  rescue => e
    raise e
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :confirm_password)
  end
end
