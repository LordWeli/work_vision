class LoginsController < AuthenticationController
  def new
    @login = Login.new
  end

  def create
    unless auth?
      @login = Login.new
      return render :new, status: :unprocessable_content
    end

    start_session(@user)

    redirect_to edit_profile_path(@user.profile)
  end
end
