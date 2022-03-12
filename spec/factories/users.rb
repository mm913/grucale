FactoryBot.define do
  factory :user do
    name                   { Faker::Name.name }
    email                  { Faker::Internet.email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    department_name        { "あああああああ" }
    
    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end