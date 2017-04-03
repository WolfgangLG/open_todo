require 'rails_helper'

RSpec.describe List, type: :model do
  let (:user) { User.create!(name: "Testy Tester", email: "tester@testy.com", password_digest: "password") }
  let (:list) { user.lists.create!(title: "My Todo list", description: "This is a todo list example description", user: user) }

  describe "attributes" do
    it "should have title and description attributes" do
      expect(list).to have_attributes(title: "My Todo list", description: "This is a todo list example description", user: user )
    end
  end
end
