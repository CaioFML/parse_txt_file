RSpec.describe ImportFile do
  describe "#call" do
    subject(:call) { described_class.call(file_content) }

    let(:file_content) { File.open(File.join(Rails.root, "lib", "dados.txt")).read }
    let(:sale) { Sale.first }

    it "creates sale" do
      expect { call }.to change(Sale, :count).by 4
    end

    it "verifies imported data" do
      call

      expect(sale.buyer.name).to eq "João Silva"
      expect(sale.buyer).to be_buyer
      expect(sale.provider.name).to eq "Bob's Pizza"
      expect(sale.provider.address).to eq "987 Fake St"
      expect(sale.provider).to be_provider
      expect(sale.product.description).to eq "R$10 off R$20 of food"
      expect(sale.product.unit_price).to eq 10.0
      expect(sale.product.quantity).to eq 2
    end
  end
end
