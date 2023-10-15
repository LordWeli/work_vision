# frozen_string_literal: true

module Contents
  class Show
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def viewer
      Content.find(id)
    end
  end
end
