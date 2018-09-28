# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::Controllers::Todos::Index, type: :action do
  let(:interactor) { instance_double(Interactors::Todos::Index) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { Hash[] }
  let(:todos) { [instance_double(Todo)] }
  let(:interactor_response) { Hanami::Interactor::Result.new(todos: todos) }

  describe '#call' do
    it 'fetches the todos' do
      expect(interactor).to fetch_all_todos
      action.call(params)
    end

    it 'is successful' do
      allow(interactor).to fetch_all_todos
      response = action.call(params)
      expect(response[0]).to eq 200
    end

    it 'exposes retrieved todos' do
      allow(interactor).to fetch_all_todos
      action.call(params)

      retrieved_todos = action.exposures[:todos]
      expect(retrieved_todos).to eq(todos)
    end
  end

  private

  def fetch_all_todos
    receive(:call).and_return(interactor_response)
  end
end
