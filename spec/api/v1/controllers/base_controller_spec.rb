require 'rails_helper'

RSpec.describe Api::V1::BaseController, type: :controller do
  let(:my_user) { create(:user) }

  context "basic user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
      controller.authenticate_user
    end

    describe "#authenticated?" do
      it "checks for the presence of an authentication token" do
        expect(controller.send(:authenticated?)).to eq(true)
      end
    end

    describe "#authenticate_user" do
      it "finds a user by their authentication token" do
        expect(assigns(:current_user)).to eq(my_user)
      end
    end
  end
end
