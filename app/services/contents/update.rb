# frozen_string_literal: true

module Contents
  class Update
    attr_reader :params, :id

    def initialize(params)
      @params = params.slice(:title, :description)
      @id = params[:id]
    end

    def updater
      content.update(params)
    end

    def content
      Content.find(id)
    end
  end
end
