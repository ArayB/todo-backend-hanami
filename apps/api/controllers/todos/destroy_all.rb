# frozen_string_literal: true

module Api::Controllers::Todos
  class DestroyAll
    include Api::Action

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Todos::DeleteAll.new
      end
    end

    def call(params)
      @interactor.call(params[:id])
      self.status = 204
    end
  end
end
