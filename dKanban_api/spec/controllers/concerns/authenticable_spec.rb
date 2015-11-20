require 'spec_helper'

class Authentication
  include Authenticable
end

describe Authenticable do

  let(:authentication) { Authentication.new }
  subject { authentication }

  describe "#current_user" do
    before do
      @user = FactoryGirl.create :user
      request.headers["Authorization"] = @user.auth_token
      authentication.stubs(:request).returns(request)
    end

    it "returns the user from the authorization header" do
      expect(authentication.current_user.auth_token).to eql @user.auth_token
    end

  end

  describe "#authenticate_with_token" do
    before do
      @user = FactoryGirl.create :user
      authentication.stubs(:current_user).returns(nil)
      response.stubs(:response_code).returns(401)
      response.stubs(:body).returns({"errors" => "Not authenticated"}.to_json)
      authentication.stubs(:response).returns(response)
    end

    it "renders a json error message" do
      expect(json_response[:errors]).to eql "Not authenticated"
    end

    it { should respond_with 401 }

  end

  describe "#user_signed_in?" do

    context "when there is a user on 'session'" do
      before do
        @user = FactoryGirl.create :user
        authentication.stubs(:current_user).returns(@user)
      end

      it { should be_user_signed_in }
    end

    context "when there is no user on 'session'" do
      before do
        @user = FactoryGirl.create :user
        authentication.stubs(:current_user).returns(nil)
      end

      it { should_not be_user_signed_in }

    end

  end

end