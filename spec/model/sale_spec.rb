RSpec.describe Sale, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:buyer).with_foreign_key("buyer_id") }
    it { is_expected.to belong_to(:provider).with_foreign_key("provider_id") }
    it { is_expected.to have_one(:product) }
  end
end
