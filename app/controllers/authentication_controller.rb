class AuthenticationController < ApplicationController
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

  def start_session(user)
    reset_session
    session[:user_id] = user.id
    Login.create!(user: user, logged: true)
  end
end
