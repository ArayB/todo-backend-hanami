RSpec.describe Api::Views::Todos::Destroy, type: :view do
  let(:exposures) { Hash[format: :json] }
  let(:view)      { described_class.new(nil, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
