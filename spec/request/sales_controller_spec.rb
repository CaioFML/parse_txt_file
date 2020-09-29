RSpec.describe SalesController, type: :request do
  describe "GET #index" do
    subject! { get sales_path }

    it "responds with http status 200" do
      expect(response).to have_http_status :ok
    end
  end
end
