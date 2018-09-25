# frozen_string_literal: true

require 'hanami/interactor'

module Interactors
  module Todos
    class Create
      include Hanami::Interactor

      expose :todo

      def initialize(dependencies = {})
        @todo_repo = dependencies.fetch(:repository) do
          TodoRepository.new
        end
      end

      def call(params)
        @todo = @todo_repo.create(params)
      end
    end
  end
end
