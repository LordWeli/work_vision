class AuthenticationController < ApplicationController
  def omniauth
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)

    if user&.persisted?
      start_session(user, provider: auth.provider)
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

  def start_session(user, provider:)
    reset_session
    session[:user_id] = user.id
    Login.create!(user: user, provider: provider, logged: true)
  end
end
