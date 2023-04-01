class AuthenticationController < ApplicationController
  def auth?
    @user = User.find_by!(email: params[:email])

    return if @user.nil?

    return BCrypt::Password.new(@user.password) == params[:password]
  end
end
