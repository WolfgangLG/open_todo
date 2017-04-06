require 'rails_helper'

RSpec.describe Api::V1::BaseController, type: :controller do
  let(:user) { create(:user) }

  context "authenticated user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user.name, user.password_digest)
    end

    describe "#authenticated?" do
      it "finds a user by their username and password" do
        expect(controller.send(:authenticated?)).to eq(true)
      end
    end
  end
end
