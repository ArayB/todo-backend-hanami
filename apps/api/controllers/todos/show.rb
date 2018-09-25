module Api::Controllers::Todos
  class Show
    include Api::Action

    expose :todo

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Todos::Show.new
      end
    end

    def call(params)
      result = @interactor.call(params[:id])
      halt 404 unless result.todo
      @todo = result.todo
    end
  end
end
