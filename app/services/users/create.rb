module Users
  class Create
    def initialize(params)
      @params = params
    end

    def creator
      User.create(@params)
    end
  end
end
