# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Interactors::Todos::DeleteAll, type: :interactor do
  let(:repo) { instance_double(TodoRepository) }
  let(:interactor) { described_class.new(repository: repo) }

  let(:todo) { instance_double(Todo) }

  it 'deletes all todos' do
    expect(repo).to receive(:clear)
    interactor.call
  end
end
