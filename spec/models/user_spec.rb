require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { User.create!(name: "Testy Tester", email: "tester@testy.com", password_digest: "password") }

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Testy Tester", email: "tester@testy.com")
    end
  end
end
