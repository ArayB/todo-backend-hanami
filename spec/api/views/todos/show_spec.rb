# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::Views::Todos::Show, type: :view do
  let(:todo) { build_todo }
  let(:exposures) { Hash[todo: todo] }

  let(:view)      { described_class.new(nil, exposures) }
  let(:rendered)  { view.render }

  it 'renders json todo' do
    expect(rendered).to eq(serialized)
  end

  private

  def build_todo
    Todo.new(
      id: 1,
      title: 'Todo Title',
      completed: false,
      order: 1
    )
  end

  def serialized
    {
      id: todo.id,
      title: todo.title,
      completed: todo.completed,
      order: todo.order,
      url: "https://example.com#{Api.routes.path(:todo, todo.id)}"
    }.to_json
  end
end
