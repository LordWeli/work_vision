class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show update]

  def show
    render json: ProfileSerializer.new(@profile).serializable_hash
  end

  def update
    @profile.update!(profile_params)

    render json: ProfileSerializer.new(@profile).serializable_hash
  rescue => e
    raise e
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def profile_params
    params.permit(:fullname, :slug_name, :age, :description, :user_id, :profile)
  end
end
