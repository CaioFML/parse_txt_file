RSpec.describe "#index", type: :system do
  before { visit sales_path }

  context "with file imported" do
    before do
      click_on "Importar"
      attach_file("file", File.join(Rails.root, "lib", "dados.txt"))
      click_on "Enviar"
    end

    it "shows page title" do
      expect(page).to have_content "Importador de vendas"
    end

    it "shows flash message" do
      expect(page).to have_content "Arquivo importado com sucesso"
    end

    it "shows all imported sales" do
      expect(page).to have_selector("table tbody tr", count: 5)
    end

    it "shows table headers" do
      expect(page).to have_selector "thead tr th[1]", text: "Comprador"
      expect(page).to have_selector "thead tr th[2]", text: "Descrição"
      expect(page).to have_selector "thead tr th[3]", text: "Preço Unitário"
      expect(page).to have_selector "thead tr th[4]", text: "Quantidade"
      expect(page).to have_selector "thead tr th[5]", text: "Endereço"
      expect(page).to have_selector "thead tr th[6]", text: "Fornecedor"
    end

    it "shows first imported file in table" do
      expect(page).to have_selector "tbody tr[1] td[1]", text: "João Silva"
      expect(page).to have_selector "tbody tr[1] td[2]", text: "R$10 off R$20 of food"
      expect(page).to have_selector "tbody tr[1] td[3]", text: "R$ 10,00"
      expect(page).to have_selector "tbody tr[1] td[4]", text: "2"
      expect(page).to have_selector "tbody tr[1] td[5]", text: "987 Fake St"
      expect(page).to have_selector "tbody tr[1] td[6]", text: "Bob's Pizza"
    end

    it "shows amount" do
      expect(page).to have_selector "td#amount", text: "R$ 95,00"
    end
  end

  context "without file imported" do
    before do
      click_on "Importar"
      click_on "Enviar"
    end

    it "shows flash message" do
      expect(page).to have_content "Arquivo não informado"
    end
  end
end
