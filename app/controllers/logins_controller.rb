class LoginsController < AuthenticationController
  def new
    @login = Login.new
  end

  def create
    render :new unless auth?

    Logins::Create.new(@user, session).creator

    redirect_to edit_profile_path(@user.profile)
  end
end
