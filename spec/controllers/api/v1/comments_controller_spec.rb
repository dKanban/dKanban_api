require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do

  describe "GET #show" do
    before(:each) do
      @demand = FactoryGirl.create :demand
      @comment = FactoryGirl.create :comment, demand: @demand

      get :show, {demand_id: @demand.id, id: @comment.id}
    end

    it "returns the information about a comment on a hash" do
      comments_response = json_response
      comment = comments_response[:comments]
      expect(comment[:content]).to eql @comment.content
    end

    it { should respond_with 201 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        demand = FactoryGirl.create :demand

        @comment_attributes = FactoryGirl.attributes_for :comment, user_owner_id: user.id, demand_id: demand.id
        api_authorization_header user.auth_token
        post :create, {demand_id: demand.id, comment: @comment_attributes }
      end

      it "renders the json representation for the comment record just created" do
        comment_response = json_response
        expect(comment_response[:content]).to eql @comment_attributes[:content]
      end

      it { should respond_with 201 }
    end

  end

  context "when is not created" do
    before(:each) do
      user = FactoryGirl.create :user
      demand = FactoryGirl.create :demand
      @invalid_comment_attributes = { content: "Smart TV", status: "TWO" }
      api_authorization_header user.auth_token
      post :create, { demand_id: demand.id , comment: @invalid_comment_attributes }
    end

    it "renders an errors json" do
      comment_response = json_response
      expect(comment_response).to have_key(:errors)
    end

    it { should respond_with 422 }
  end

  describe "DELETE #destroy" do
    before(:each) do
      user = FactoryGirl.create :user
      demand = FactoryGirl.create :demand
      comment = FactoryGirl.create :comment, demand: demand

      api_authorization_header user.auth_token
      delete :destroy, { demand_id: demand.id, id: comment.id }
    end

    it { should respond_with 204 }

  end

  describe "GET #index" do
    before(:each) do
      user = FactoryGirl.create :user
      demand = FactoryGirl.create :demand
      api_authorization_header user.auth_token
      get :index, { demand_id: demand.id }
    end

    it { should respond_with 201 }

  end

end
