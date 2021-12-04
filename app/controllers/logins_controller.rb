class LoginsController < AuthenticationController
  def new
    @login = Login.new
  end

  def create
    if auth?
      @login = Login.new(user_id: @user.id)
      create_login
    else
      render :new
    end
  end

  private

  def create_login
    if @login.save
      session[:user_id] = @user.id
      redirect_to edit_user_profile_path(@user.user_profile.id)
    else
      render :new
    end
  end
end
