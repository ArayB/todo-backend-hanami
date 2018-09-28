# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::Controllers::Todos::Update, type: :action do
  let(:interactor) { instance_double(Interactors::Todos::Update) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { todo_params }
  let(:todo) { instance_double(Todo) }
  let(:interactor_response) { Hanami::Interactor::Result.new(todo: todo) }

  describe '#call' do
    context 'with valid parameters' do
      it 'is successful' do
        allow(interactor).to update_todo
        response = action.call(params)
        expect(response[0]).to eq 200
      end

      it 'updates a todo' do
        expect(interactor).to update_todo
        action.call(params)
      end

      it 'exposes the todo' do
        allow(interactor).to update_todo

        action.call(params)
        expect(action.exposures[:todo]).to eq(todo)
      end
    end

    context 'when todo does not exist' do
      it 'returns 404' do
        allow(interactor)
          .to receive(:call)
          .with(todo_params)
          .and_return(Hanami::Interactor::Result.new(todo: nil))
        response = action.call(params)
        expect(response[0]).to eq 404
      end
    end
  end

  private

  def todo_params
    {
      title: 'Updated title',
      order: 1,
      completed: true
    }
  end

  def update_todo
    receive(:call).with(todo_params).and_return(interactor_response)
  end
end
