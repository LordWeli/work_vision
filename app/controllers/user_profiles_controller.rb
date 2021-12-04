class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to user_profile_path
    else
      render :edit
    end
  end

  private

  def set_user_profile
    @user_profile = UserProfile.find(session[:user_id])
  end

  def user_profile_params
    return if params[:user_profile].nil?

    params.require(:user_profile).permit(:fullname, :slug_name, :age, :description)
  end
end
