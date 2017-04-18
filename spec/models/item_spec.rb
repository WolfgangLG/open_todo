require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }
  let(:item) { create(:item, list: list) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:completed)}

  describe "attributes" do
    it "should have name and body attributes" do
      expect(item).to have_attributes(name: item.name, body: item.body, list: list)
    end
  end
end
