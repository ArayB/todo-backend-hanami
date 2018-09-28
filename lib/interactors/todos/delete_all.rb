# frozen_string_literal: true

require 'hanami/interactor'

module Interactors
  module Todos
    class DeleteAll
      include Hanami::Interactor

      def initialize(dependencies = {})
        @todo_repo = dependencies.fetch(:repository) do
          TodoRepository.new
        end
      end

      def call
        @todo_repo.clear
      end
    end
  end
end
