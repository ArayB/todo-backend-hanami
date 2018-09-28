# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Interactors::Todos::Update, type: :interactor do
  let(:repo) { instance_double(TodoRepository) }
  let(:interactor) { described_class.new(repository: repo) }

  let(:todo_params) { build_todo_params }
  let(:todo) { instance_double(Todo) }

  describe '#call' do
    it 'updates a todo' do
      expect(repo).to update_todo
      interactor.call(todo_params)
    end

    it 'exposes the updated todo' do
      allow(repo).to update_todo
      result = interactor.call(todo_params)
      expect(result.todo).to eq(todo)
    end
  end

  private

  def build_todo_params
    {
      id: '1',
      title: 'Todo title',
      order: 1,
      completed: true
    }
  end

  def update_todo
    receive(:update).with("1", todo_params).and_return(todo)
  end
end
