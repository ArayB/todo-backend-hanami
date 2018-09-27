# frozen_string_literal: true

module Interactors
  module Todos
    class Update
      include Hanami::Interactor

      expose :todo

      def initialize(dependencies = {})
        @todo_repo = dependencies.fetch(:repository) do
          TodoRepository.new
        end
      end

      def call(params)
        @todo = @todo_repo.update(params[:id], params)
      end
    end
  end
end
