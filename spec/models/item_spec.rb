require 'rails_helper'

RSpec.describe Item, type: :model do
  let (:user) { User.create!(name: "Testy Tester", email: "tester@testy.com", password_digest: "password") }
  let (:list) { user.lists.create!(title: "My Todo list", description: "This is a todo list example description", user: user) }
  let (:item) { Item.create!(name: "To do list item name", body: "To do list item body example", list: list) }

  describe "attributes" do
    it "should have name and body attributes" do
      expect(item).to have_attributes(name: "To do list item name", body: "To do list item body example", list: list)
    end
  end
end
