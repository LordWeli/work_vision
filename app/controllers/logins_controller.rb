class LoginsController < AuthenticationController
  def new; end

  def create
    user = Logins::Authenticate.new(email: params[:email], password: params[:password]).call

    unless user
      flash.now[:alert] = "E-mail ou senha inválidos."
      return render :new, status: :unprocessable_content
    end

    start_session(user)

    redirect_to edit_profile_path(user.profile)
  end
end
