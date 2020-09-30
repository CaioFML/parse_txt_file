RSpec.describe Product, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:sale) }
  end

  describe "#amount" do
    subject { product.amount }

    let(:product) { Product.new(quantity: 3, unit_price: 20.0) }

    it { is_expected.to eq 60.0 }
  end
end
