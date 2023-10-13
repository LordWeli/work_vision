# frozen_string_literal: true

module Contents
  class Create
    attr_reader :params, :user_id

    def initialize(params)
      @params = params.except(:user_id)
      @user_id = params[:user_id]
    end

    def creator
      Content.create(@params.merge(profile_id: profile_id))
    end

    private

    def profile_id
      Profile.find_by(user_id: user_id).id
    end
  end
end
