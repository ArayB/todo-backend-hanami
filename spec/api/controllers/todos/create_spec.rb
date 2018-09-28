# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::Controllers::Todos::Create, type: :action do
  let(:interactor) { instance_double(Interactors::Todos::Create) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { todo_params }
  let(:todo) { instance_double(Todo) }
  let(:interactor_response) { Hanami::Interactor::Result.new(todo: todo) }

  describe '#call' do
    context 'with valid parameters' do
      it 'creates a new todo' do
        expect(interactor).to create_new_todo
        action.call(params)
      end

      it 'returns success response' do
        allow(interactor).to create_new_todo

        response = action.call(params)
        expect(response[0]).to eq 200
      end

      it 'exposes the new todo' do
        allow(interactor).to create_new_todo

        action.call(params)
        expect(action.exposures[:todo]).to eq(todo)
      end
    end

    context 'when missing required params' do
      it 'returns unprocessable entity status' do
        response = action.call(Hash[])
        expect(response[0]).to eq(422)
      end
    end
  end

  private

  def todo_params
    {
      title: 'Todo title',
    }
  end

  def create_new_todo
    receive(:call).with(todo_params).and_return(interactor_response)
  end
end
