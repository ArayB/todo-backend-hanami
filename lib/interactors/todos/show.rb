# frozen_string_literal: true

module Interactors
  module Todos
    class Show
      include Hanami::Interactor

      expose :todo

      def initialize(dependencies = {})
        @todo_repo = dependencies.fetch(:repository) do
          TodoRepository.new
        end
      end

      def call(id)
        @todo = @todo_repo.find(id)
      end
    end
  end
end
