module Api::Controllers::Todos
  class Update
    include Api::Action

    expose :todo

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Todos::Update.new
      end
    end

    def call(params)
      result = @interactor.call(params.raw)
      halt 404 unless result.todo
      @todo = result.todo
    end
  end
end
