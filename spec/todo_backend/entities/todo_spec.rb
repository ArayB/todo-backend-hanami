# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Todo, type: :entity do
  describe '#url' do
    it 'returns correct url' do
      todo = Todo.new(id: 1, title: 'Title')
      # Domain is set in .env.test
      expect(todo.url).to eq("https://example.com#{Api.routes.path(:todo, todo.id)}")
    end
  end
end
