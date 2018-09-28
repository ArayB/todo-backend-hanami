RSpec.describe Api::Controllers::Todos::Destroy, type: :action do
  let(:interactor) { instance_double(Interactors::Todos::Delete) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { Hash[id: 1] }
  let(:todo) { instance_double(Todo) }
  let(:interactor_response) { Hanami::Interactor::Result.new }

  it 'is successful' do
    allow(interactor).to delete_todo
    response = action.call(params)
    expect(response[0]).to eq 204
  end

  it 'calls delete interactor' do
    expect(interactor).to delete_todo
    action.call(params)
  end

  private

  def delete_todo
    receive(:call).with(1).and_return(interactor_response)
  end
end
