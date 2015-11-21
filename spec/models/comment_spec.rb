require 'rails_helper'

RSpec.describe Comment, type: :model do
  before { @comment = FactoryGirl.build(:comment)}

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:attatchment) }
  it { should respond_to(:user_owner_id) }
  it { should respond_to(:demand_id) }

  it{ should be_valid }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_owner_id) }
  it { should validate_presence_of(:demand_id) }

  it { should belong_to :demand }
  it { should belong_to :user_owner }

end
