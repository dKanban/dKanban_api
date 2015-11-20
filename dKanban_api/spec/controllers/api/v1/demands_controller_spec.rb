require 'rails_helper'

RSpec.describe Api::V1::DemandsController, type: :controller do

  describe "GET #show" do
    before(:each) do
      @demand = FactoryGirl.create :demand
      get :show, id: @demand
    end

    it "returns the information about a demand on a hash" do
      demands_response = json_response
      expect(demands_response[:title]).to eql @demand.title
    end

    it { should respond_with 200 }
  end




  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        @demand_attributes = FactoryGirl.attributes_for :demand, developer_owner_id: user
        api_authorization_header user.auth_token
        post :create, {user_id: user.id,demand: @demand_attributes }
      end

      it "renders the json representation for the demand record just created" do
        demand_response = json_response
        expect(demand_response[:title]).to eql @demand_attributes[:title]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        user = FactoryGirl.create :user
        @invalid_demand_attributes = { title: "Smart TV", status: "TWO" }
        api_authorization_header user.auth_token
        post :create, { user_id: user.id , demand: @invalid_demand_attributes }
      end

      it "renders an errors json" do
        demand_response = json_response
        expect(demand_response).to have_key(:errors)
      end

      it "renders the json errors on whye the demand could not be created" do
        demand_response = json_response
        expect(demand_response[:errors][:status]).to include "is not a number"
      end

      it { should respond_with 422 }
    end
  end




  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
      @demand = FactoryGirl.create :demand, developer_owner: @user
      api_authorization_header @user.auth_token
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { developer_owner_id: @user.id, id: @demand.id,
                         demand: { title: "Create a class" } }
      end

      it "renders the json representation for the updated demand" do
        demand_response = json_response
        expect(demand_response[:title]).to eql "Create a class"
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, { developer_owner_id: @user.id, id: @demand.id,
                         demand: { status: "two hundred" } }
      end

      it "renders an errors json" do
        demand_response = json_response
        expect(demand_response).to have_key(:errors)
      end

      it "renders the json errors on whye the demand could not be created" do
        product_response = json_response
        expect(product_response[:errors][:status]).to include "is not a number"
      end

      it { should respond_with 422 }
    end
  end

  describe "GET #my_developed_demands" do
    context "when has demands" do
      before(:each) do
        user = FactoryGirl.create :user
        demand = FactoryGirl.create :demand, developer_owner_id: user.id

        api_authorization_header user.auth_token
        get :my_developed_demands, {user_id: user.id}
      end

      it "renders the json representation for the demands records" do
        demand_response = json_response
        expect(demand_response.count).to eql 1
      end

      it { should respond_with 200 }
    end
  end

  describe "GET #my_requested_demands" do
    context "when has demands" do
      before(:each) do
        user = FactoryGirl.create :user
        demand = FactoryGirl.create :demand, client_owner_id: user.id

        api_authorization_header user.auth_token
        get :my_requested_demands, {user_id: user.id}
      end

      it "renders the json representation for the demands records" do
        demand_response = json_response
        expect(demand_response.count).to eql 1
      end

      it { should respond_with 200 }
    end
  end

  
end
