class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: %i[show]

  def show
  end

  private

  def set_user_profile
    @user_profile = UserProfile.find(session[:user_id])
  end
end
