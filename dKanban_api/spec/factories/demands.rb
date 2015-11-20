FactoryGirl.define do
  factory :demand do
    title "MyString"
    description "MyString"
    association :developer_owner, factory: :user
    association :client_owner, factory: :user
    status 1
    priority 1

  end

end
