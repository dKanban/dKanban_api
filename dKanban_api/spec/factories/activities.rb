FactoryGirl.define do
  factory :activity do
    description FFaker::Lorem.phrase.to_s
    activity_type 1
    association :demand, factory: :demand
  end

end
