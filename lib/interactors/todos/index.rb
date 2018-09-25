# frozen_string_literal: true

module Interactors
  module Todos
    class Index
      include Hanami::Interactor

      expose :todos

      def initialize(dependencies = {})
        @todo_repo = dependencies.fetch(:repository) do
          TodoRepository.new
        end
      end

      def call
        @todos = @todo_repo.all
      end
    end
  end
end
