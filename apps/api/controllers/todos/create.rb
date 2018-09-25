module Api::Controllers::Todos
  class Create
    include Api::Action

    expose :todo

    # params do
    #   required(:todo).schema do
    #     required(:title).filled(:str?)
    #   end
    # end

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Todos::Create.new
      end
    end

    def call(params)
      Hanami.logger.info "Params: #{params.to_h}"
      # halt 422 unless params.valid?
      result = @interactor.call(params[:todo])
      @todo = result.todo
    end
  end
end
