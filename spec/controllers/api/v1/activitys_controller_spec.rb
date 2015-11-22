require 'rails_helper'

RSpec.describe Api::V1::ActivitysController, type: :controller do

  describe "GET #show" do
    before(:each) do
      user = FactoryGirl.create :user
      @demand = FactoryGirl.create :demand
      @activity = FactoryGirl.create :activity, demand: @demand
      api_authorization_header user.auth_token
      get :show, {demand_id: @demand.id, id: @activity.id}
    end

    it "returns the information about a activity on a hash" do
      activitys_response = json_response
      activity = activitys_response[:activitys]
      expect(activity[:description]).to eql @activity.description
    end

    it { should respond_with 201 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        demand = FactoryGirl.create :demand

        @activity_attributes = FactoryGirl.attributes_for :activity, demand_id: demand.id
        api_authorization_header user.auth_token
        post :create, {demand_id: demand.id, activity: @activity_attributes }
      end

      it "renders the json representation for the activity record just created" do
        activity_response = json_response
        expect(activity_response[:description]).to eql @activity_attributes[:description]
      end

      it { should respond_with 201 }
    end

  end

  context "when is not created" do
    before(:each) do
      user = FactoryGirl.create :user
      demand = FactoryGirl.create :demand
      @invalid_activity_attributes = { description: "Smart TV", status: "TWO" }
      api_authorization_header user.auth_token
      post :create, { demand_id: demand.id , activity: @invalid_activity_attributes }
    end

    it "renders an errors json" do
      activity_response = json_response
      expect(activity_response).to have_key(:errors)
    end

    it { should respond_with 422 }
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
