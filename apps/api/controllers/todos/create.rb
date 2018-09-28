module Api::Controllers::Todos
  class Create
    include Api::Action

    expose :todo

    params do
      required(:title).filled(:str?)
      optional(:order).filled(:int?)
      optional(:completed).filled(:bool?)
    end

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Todos::Create.new
      end
    end

    def call(params)
      halt 422 unless params.valid?
      result = @interactor.call(params.raw)
      @todo = result.todo
    end
  end
end
