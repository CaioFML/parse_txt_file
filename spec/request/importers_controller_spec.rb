RSpec.describe ImportersController, type: :request do
  describe "POST #create" do
    subject! { post importers_path, params: { file: file } }

    shared_examples "upload file" do |message|
      it "responds with http status 200" do
        expect(response).to have_http_status :found
      end

      it "redirects to sales index" do
        expect(response).to redirect_to sales_path
      end

      it "sets flash notice" do
        expect(flash[:notice]).to eq message
      end
    end

    context "with file" do
      let(:file) { fixture_file_upload(File.join(Rails.root, "lib", "dados.txt")) }

      include_examples "upload file", "Arquivo importado com sucesso"
    end

    context "without file" do
      let(:file) { nil }

      include_examples "upload file", "Arquivo não informado"
    end
  end
end
