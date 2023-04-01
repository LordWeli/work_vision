module Logins
  class Create
    def initialize(user, session)
      @user = user
      @session = session
    end

    def creator
      Login.create(user_id: @user.id)

      @session[:user_id] = @user.id
    rescue => e
      raise e
    end
  end
end
