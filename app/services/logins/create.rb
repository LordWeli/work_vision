module Logins
  # Authenticates a user by e-mail and password.
  # Returns the user on success, nil otherwise.
  class Create
    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def call
      user = User.find_by(email: @email)

      user if user&.authenticate(@password)
    end
  end
end
