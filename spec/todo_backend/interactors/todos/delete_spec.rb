# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Interactors::Todos::Delete, type: :interactor do
  let(:repo) { instance_double(TodoRepository) }
  let(:interactor) { described_class.new(repository: repo) }

  let(:todo) { instance_double(Todo) }

  describe '#call' do
    it 'deletes a todo' do
      expect(repo)
        .to receive(:delete)
        .with(1)
        .and_return(todo)
      interactor.call(1)
    end
  end
end
