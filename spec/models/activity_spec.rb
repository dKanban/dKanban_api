require 'rails_helper'

RSpec.describe Activity, type: :model do
  before { @activity = FactoryGirl.build(:activity)}

  subject { @activity }

  it { should respond_to(:description) }
  it { should respond_to(:activity_type)}
  it { should respond_to(:demand_id) }

  it{ should be_valid }

  it { should validate_presence_of(:activity_type) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:demand_id) }

  it { should belong_to :demand }

  end
