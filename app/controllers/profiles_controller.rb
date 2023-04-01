class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(session[:user_id])
  end

  def profile_params
    return if params[:profile].nil?

    params.require(:profile).permit(:fullname, :slug_name, :age, :description)
  end
end
