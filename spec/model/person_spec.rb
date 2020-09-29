RSpec.describe Person do
  describe "enums" do
    it { expect(Person.new(kind: 0)).to be_buyer }
    it { expect(Person.new(kind: 1)).to be_provider }
  end
end
