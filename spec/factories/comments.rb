FactoryGirl.define do
  factory :comment do
    content FFaker::Lorem.phrase.to_s
    association :demand, factory: :demand
    association :user_owner, factory: :user
  end

end
