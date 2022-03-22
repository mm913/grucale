FactoryBot.define do
  factory :group do
    group_name     { "ABCDEF" }
    note           { Faker::Lorem.sentence }
  end
end
