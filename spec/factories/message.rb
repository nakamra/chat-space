FactoryGirl.define do

  factory :message do
    body         {Faker::StarWars.quote}
    factory :invalid_message do
      body nil
    end
  end
end
