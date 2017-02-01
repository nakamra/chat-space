FactoryGirl.define do
  password = Faker::Internet.password(8)

  factory :user do
    name                    { Faker::GameOfThrones.character}
    email                   { Faker::Internet.email}
    password                password
    password_confirmation   password
  end
end
