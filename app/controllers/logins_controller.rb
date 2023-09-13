class LoginsController < AuthenticationController
  before_action :login_params, only: %i[create]

  def create
    render :new unless auth?

    Logins::Create.new(@user, session).creator

    render json: true, status: :ok
  rescue => e
    raise e
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
