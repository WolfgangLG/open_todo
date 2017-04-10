require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:json) { JSON.parse(response.body) }

  context "authenticated user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user.name, user.password_digest)
      @new_user = build(:user)
    end

    describe "POST create" do
      before { post :create, user: { name: @new_user.name, password_digest: @new_user.password_digest, email: @new_user.email } }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a post with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json["name"]).to eq(@new_user.name)
        expect(hashed_json["email"]).to eq(@new_user.email)
      end
    end

    describe "GET index" do
      before { get :index }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq("application/json")
      end

      it "returns parsed json response user name" do
        expect(json[0]['name']).to eq(user.name)
      end
    end

    describe "GET show" do
      before { get :show, id: user.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "returns parsed json response user name" do
        expect(json['name']).to eq(user.name)
      end
    end
  end
end
