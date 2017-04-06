require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:json) { JSON.parse(response.body) }

  context "authenticated user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user.name, user.password_digest)
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
