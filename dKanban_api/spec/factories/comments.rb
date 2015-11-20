FactoryGirl.define do
  factory :comment do
    content FFaker::Lorem.phrase.to_s
    demand factory: :demand
    user_owner factory: :user
  end

end
