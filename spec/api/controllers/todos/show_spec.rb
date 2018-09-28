RSpec.describe Api::Controllers::Todos::Show, type: :action do
  let(:interactor) { instance_double(Interactors::Todos::Show) }
  let(:action) { described_class.new(interactor: interactor) }

  let(:params) { Hash[id: 1] }
  let(:todo) { instance_double(Todo) }
  let(:interactor_response) { Hanami::Interactor::Result.new(todo: todo) }

  describe '#call' do
    it 'is successful' do
      allow(interactor).to retrieve_todo

      response = action.call(params)
      expect(response[0]).to eq 200
    end

    it 'exposes retrieved todo' do
      allow(interactor).to retrieve_todo
      action.call(params)
      expect(action.exposures[:todo]).to eq(todo)
    end

    context 'when todo not found' do
      it 'returns not found status' do
        allow(interactor)
          .to receive(:call)
          .with(params[:id])
          .and_return(Hanami::Interactor::Result.new(todo: nil))

        response = action.call(params)
        expect(response[0]).to eq 404
      end

    end
  end

  private

  def retrieve_todo
    receive(:call).with(params[:id]).and_return(interactor_response)
  end
end
