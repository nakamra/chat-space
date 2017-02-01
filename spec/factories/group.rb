FactoryGirl.define do

  factory :group do
    name     { Faker::GameOfThrones.house}
  end
end
