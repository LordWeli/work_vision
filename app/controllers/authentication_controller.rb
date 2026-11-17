class AuthenticationController < ApplicationController
  def auth?
    @user = User.find_by!(email: params[:email])

    return if @user.nil?

    @user.authenticate(params[:password]).present?
  end

  def omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user&.persisted?
      start_session(user)
      redirect_to edit_profile_path(user.profile)
    else
      redirect_to new_login_path, alert: "Não foi possível entrar com o Google."
    end
  end

  def failure
    alert = if params[:message] == "access_denied"
      "Login com Google cancelado."
    else
      "Não foi possível entrar com o Google."
    end

    redirect_to new_login_path, alert: alert
  end

  private

  # Rotates the session id before authenticating to prevent session fixation
  def start_session(user)
    reset_session
    Logins::Create.new(user, session).creator
  end
end
