module Api::Controllers::Todos
  class Index
    include Api::Action

    expose :todos

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Todos::Index.new
      end
    end


    def call(_params)
      result = @interactor.call
      @todos = result.todos
    end
  end
end
