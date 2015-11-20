FactoryGirl.define do
  factory :activity do
    description FFaker::Lorem.phrase.to_s
    type 1
    demand factory: :demand
  end

end
