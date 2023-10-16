class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, only: [:update], if: -> { Rails.env.development? }
end
