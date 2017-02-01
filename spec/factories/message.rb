FactoryGirl.define do

  factory :message do
    body         {Faker::StarWars.quote}
  end
end
