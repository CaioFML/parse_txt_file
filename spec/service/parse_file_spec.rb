RSpec.describe ParseFile do
  describe "#call" do
    subject(:call) { described_class.call(File.join(Rails.root, "lib", "dados.txt")) }

    let(:result) do
      {
        comprador: ["João Silva", "Amy Pond", "Marty McFly", "Snake Plissken"],
        descrição: [
          "R$10 off R$20 of food", "R$30 of awesome for R$10", "R$20 Sneakers for R$5", "R$20 Sneakers for R$5"
        ],
        preço_unitário: %w[10.0 10.0 5.0 5.0],
        quantidade: %w[2 5 1 4],
        endereço: ["987 Fake St", "456 Unreal Rd", "123 Fake St", "123 Fake St"],
        fornecedor: ["Bob's Pizza", "Tom's Awesome Shop", "Sneaker Store Emporium", "Sneaker Store Emporium"]
      }
    end

    it "transforms data in file to hash" do
      expect(call).to eq result
    end
  end
end
