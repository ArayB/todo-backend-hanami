# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::Controllers::Todos::DestroyAll, type: :action do
  let(:interactor) { instance_double(Interactors::Todos::DeleteAll) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { Hash[] }
  let(:interactor_response) { Hanami::Interactor::Result.new }

  it 'is successful' do
    allow(interactor).to delete_all_todos
    response = action.call(params)
    expect(response[0]).to eq 204
  end

  it 'calls delete all interactor' do
    expect(interactor).to delete_all_todos
    action.call(params)
  end

  private

  def delete_all_todos
    receive(:call).and_return(interactor_response)
  end
end
