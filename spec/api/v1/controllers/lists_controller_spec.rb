require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_list) { create(:list, user: user) }
  let(:json) { JSON.parse(response.body) }

  context "authenticated user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user.name, user.password_digest)
      @new_list = build(:list)
    end

    describe "POST create" do
      before { post :create, user_id: user.id, list: { title: @new_list.title, description: @new_list.description} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a list with the correct attributes" do
        expect(json["title"]).to eq(@new_list.title)
        expect(json["description"]).to eq(@new_list.description)
      end
    end

    describe "PUT update" do
      before { put :update, user_id: user.id, id: my_list.id, list: { title: @new_list.title}, description: @new_list.description, permission: @new_list.permission  }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "updates a list with the correct attributes" do
        expect(json["title"]).to eq(@new_list.title)
        expect(json["description"]).to eq(@new_list.description)
      end
    end

    describe "GET index" do
      before { get :index, user_id: user.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq("application/json")
      end
    end

    describe "GET show" do
      before { get :show, user_id: user.id, id: my_list.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "returns parsed json response user name" do
        expect(json{0}['title']).to eq(my_list.title)
      end
    end
  end
end
