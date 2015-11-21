require 'rails_helper'

RSpec.describe Demand, type: :model do
  before { @demand = FactoryGirl.build(:demand)}

  subject { @demand }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:client_owner_id) }
  it { should respond_to(:developer_owner_id) }
  it { should respond_to(:status) }
  it { should respond_to(:priority) }

  it{ should be_valid }

  it { should validate_presence_of(:developer_owner_id) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:title) }

  it { should belong_to :client_owner }
  it { should belong_to :developer_owner }


end
