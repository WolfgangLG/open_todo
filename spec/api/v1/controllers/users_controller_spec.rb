require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:json) { JSON.parse(response.body) }

  context "unauthenticated user" do
    it "GET index returns http unauthenticated" do
      get :index
      expect(response).to have_http_status(401)
    end

    it "GET show returns http unauthenticated" do
      get :show, id: user.id
      expect(response).to have_http_status(401)
    end

    it "POST create returns http unauthenticated" do
      new_user = build(:user)
      post :create, user: { name: new_user.name, email: new_user.email, password: new_user.password_digest }
      expect(response).to have_http_status(401)
    end

    it "DELETE destroy returns http unauthenticated" do
      delete :destroy, { id: user.id }
      expect(response).to have_http_status(401)
    end
  end

  context "authenticated user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(user.auth_token)
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

      it "creates a user with the correct attributes" do
        expect(json["name"]).to eq(@new_user.name)
        expect(json["email"]).to eq(@new_user.email)
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

    describe "DELETE destroy" do
      it "deletes the user" do
        delete :destroy, { id: user.id }
        count = User.where({id: user.id }).size
        expect(count).to eq 0
      end

      it "returns http content not found" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
