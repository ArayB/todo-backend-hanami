# frozen_string_literal: true

require 'hanami/interactor'

module Interactors
  module Todos
    class Delete
      include Hanami::Interactor

      def initialize(dependencies = {})
        @todo_repo = dependencies.fetch(:repository) do
          TodoRepository.new
        end
      end

      def call(user_id)
        @todo_repo.delete(user_id)
      end
    end
  end
end
