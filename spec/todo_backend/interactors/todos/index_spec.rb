# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Interactors::Todos::Index, type: :interactor do
  let(:repo) { instance_double(TodoRepository) }
  let(:interactor) { described_class.new(repository: repo) }

  let(:todos) { [instance_double(Todo)] }

  describe '#call' do
    it 'fetches all todos' do
      expect(repo).to receive(:all).and_return(todos)
      interactor.call
    end
  end
end
