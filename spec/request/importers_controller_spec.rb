RSpec.describe ImportersController, type: :request do
  describe "POST #create" do
    subject(:create) { post importers_path, params: { file: file } }

    shared_examples "upload file" do |message|
      it "responds with http status 200" do
        subject

        expect(response).to have_http_status :found
      end

      it "redirects to sales index" do
        subject

        expect(response).to redirect_to sales_path
      end

      it "sets flash notice" do
        subject

        expect(flash[:notice]).to eq message
      end
    end

    context "with file" do
      let(:file_path) { File.join(Rails.root, "lib", "dados.txt") }
      let(:file) { fixture_file_upload(file_path) }
      let(:file_content) { File.open(file_path).read }

      it "imports file content" do
        expect(ImportFile).to receive(:call).with(file_content)

        create
      end

      include_examples "upload file", "Arquivo importado com sucesso"
    end

    context "without file" do
      let(:file) { nil }

      it "doesn't import file content" do
        expect(ImportFile).not_to receive(:call)

        create
      end

      include_examples "upload file", "Arquivo não informado"
    end
  end
end
