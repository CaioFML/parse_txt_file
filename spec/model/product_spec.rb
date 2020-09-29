RSpec.describe Product, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:sale) }
  end
end