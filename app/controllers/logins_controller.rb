class LoginsController < AuthenticationController
  def new
    @login = Login.new
  end

  def create
    unless auth?
      @login = Login.new
      return render :new, status: :unprocessable_content
    end

    Logins::Create.new(@user, session).creator

    redirect_to edit_profile_path(@user.profile)
  end
end
