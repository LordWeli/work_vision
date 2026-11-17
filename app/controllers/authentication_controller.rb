class AuthenticationController < ApplicationController
  def auth?
    @user = User.find_by!(email: params[:email])

    return if @user.nil?

    @user.authenticate(params[:password]).present?
  end
end
