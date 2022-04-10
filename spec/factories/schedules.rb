FactoryBot.define do
  factory :schedule do
    title         { "ABCD" }
    start_time    { "2022/04/30/12/0/0" }
    finish_time   { "2022/04/30/13/0/0" }
    note          { Faker::Lorem.sentence }
    association :user
    association :group
  end
end
