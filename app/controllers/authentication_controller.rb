class AuthenticationController < ApplicationController
  def auth?
    @user = User.find_by!(email: params[:email])

    return if @user.blank?

    bcrypt_password == params[:password]
  end

  private

  def bcrypt_password
    BCrypt::Password.new(@user.password)
  end
end
