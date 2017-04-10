require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }

  it { is_expected.to validate_presence_of(:title) }

  describe "attributes" do
    it "should have title and description attributes" do
      expect(list).to have_attributes(title: list.title, description: list.description, user: user )
    end
  end
end
