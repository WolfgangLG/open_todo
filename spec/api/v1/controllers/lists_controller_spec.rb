require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_list) { create(:list, user: user) }

   describe "GET index" do
     before { get :index }

     it "returns http success" do
       expect(response).to have_http_status(:success)
     end

     it "returns json content type" do
       expect(response.content_type).to eq("application/json")
     end

    #  it "returns my_list serialized" do
    #    expect(response.body).to eq([my_list].to_json)
    #  end
   end

   describe "GET show" do
     before { get :show, id: my_list.id }

     it "returns http success" do
       expect(response).to have_http_status(:success)
     end

     it "returns json content type" do
       expect(response.content_type).to eq 'application/json'
     end

    #  it "returns my_list serialized" do
    #    expect(response.body).to eq(my_list.to_json)
    #  end
   end
end
