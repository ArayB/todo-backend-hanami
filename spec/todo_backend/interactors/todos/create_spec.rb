# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Interactors::Todos::Create, type: :interactor do
  let(:repo) { instance_double(TodoRepository) }
  let(:interactor) { described_class.new(repository: repo) }

  let(:todo_params) { build_todo_params }
  let(:todo) { instance_double(Todo) }

  describe '#call' do
    it 'creates a todo' do
      expect(repo).to create_new_todo
      interactor.call(todo_params)
    end

    it 'exposes the created todo' do
      allow(repo).to create_new_todo

      result = interactor.call(todo_params)
      expect(result.todo).to eq(todo)
    end
  end

  private

  def build_todo_params
    {
      title: 'Todo title'
    }
  end

  def create_new_todo
    receive(:create).with(todo_params).and_return(todo)
  end
end
