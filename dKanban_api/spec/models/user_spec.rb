require 'spec_helper'

describe User do

  before { @user = FactoryGirl.build(:user)}

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it{ should be_valid }

  describe "when email is not presente" do

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { should allow_value('example@domain.com').for(:email) }

  end

  it { should respond_to(:auth_token) }
  it { should validate_uniqueness_of(:auth_token) }

  describe "#generate_authentication_token" do
    it "generates a unique token" do
      Devise.stubs(:friendly_token).returns("auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql "auniquetoken123"
    end

    it "generate another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end

  describe "#user association" do
    before do
      @user.save

      3.times {
        new_location = FactoryGirl.build :location
        FactoryGirl.create :user_location, user: @user, location: new_location
      }

    end

    it "destroys the associated user_locations on self destruct" do
      user_locations = UserLocation.where(:user_id => @user.id)
      @user.destroy
      user_locations.each do |user_location|
        expect(UserLocation.find(user_location)).to raise_error ActiveRecord::RecordNotFound
      end
    end

  end

  it { should have_one(:physical_person) }

  describe "#physical_person association" do

    before do
      @user.save
      FactoryGirl.create :physical_person, user: @user
    end

    it "destroys the associated physical_person on self destruct" do
      physical_person = @user.physical_person
      @user.destroy
      # expect(PhysicalPerson.find(physical_person.id)).to raise_error ActiveRecord::RecordNotFound
    end
  end

end
