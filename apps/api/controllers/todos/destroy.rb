module Api::Controllers::Todos
  class Destroy
    include Api::Action

    def initialize(dependencies = {})
      @interactor = dependencies.fetch(:interactor) do
        Interactors::Todos::Delete.new
      end
    end

    def call(params)
      @interactor.call(params[:id])
      self.status = 204
    end
  end
end
