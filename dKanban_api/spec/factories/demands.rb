FactoryGirl.define do
  factory :demand do
    title FFaker::Lorem.word.to_s
    description FFaker::Lorem.phrase.to_s
    client_owner factory: :user
    developer_owner factory: :user
    status 1
    priority 1

  end

end
