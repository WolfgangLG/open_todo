require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
 let (:user) { User.create!(name: "Testy Tester", email: "tester@testy.com", password_digest: "password") }
 let (:my_list) { user.lists.create!(title: "My Todo list", description: "This is a todo list example description", user: user) }
 let!(:my_item) { my_list.items.create!(name: "To do list item name", body: "To do list item body example", list: my_list) }

   describe "GET index" do
     before { get :index }

     it "returns http success" do
       expect(response).to have_http_status(:success)
     end

     it "returns json content type" do
       expect(response.content_type).to eq("application/json")
     end

     it "returns my_item serialized" do
       expect(response.body).to eq([my_item].to_json)
     end
   end

   describe "GET show" do
     before { get :show, id: my_item.id }

     it "returns http success" do
       expect(response).to have_http_status(:success)
     end

     it "returns json content type" do
       expect(response.content_type).to eq 'application/json'
     end

     it "returns my_item serialized" do
       expect(response.body).to eq(my_item.to_json)
     end
   end
end
