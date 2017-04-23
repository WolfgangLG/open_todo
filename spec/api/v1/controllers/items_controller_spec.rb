require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_list) { create(:list, user: user) }
  let(:my_item) { create(:item, list: my_list, user: user) }
  let(:json) { JSON.parse(response.body) }

  context "authenticated user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(user.auth_token)
      @new_item = build(:item)
    end

    describe "POST create" do
      before { post :create, list_id: my_list.id, item: { name: @new_item.name, body: @new_item.body, completed: @new_item.completed} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a item with the correct attributes" do
        expect(json["name"]).to eq(@new_item.name)
        expect(json["body"]).to eq(@new_item.body)
      end
    end

    describe "PUT update" do
      before { put :update, list_id: my_list.id, id: my_item.id, item: { name: @new_item.name, body: @new_item.body, completed: @new_item.completed } }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "updates an item with the correct attributes" do
        expect(json["name"]).to eq(@new_item.name)
        expect(json["body"]).to eq(@new_item.body)
        expect(json["completed"]).to eq(@new_item.completed)
      end
    end

    describe "GET index" do
      before { get :index, list_id: my_list.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq("application/json")
      end
    end

    describe "GET show" do
      before { get :show, list_id: my_list.id, id: my_item.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "returns parsed json response user name" do
        expect(json{0}['body']).to eq(my_item.body)
      end
    end
  end
end
