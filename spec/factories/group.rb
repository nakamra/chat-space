FactoryGirl.define do

  factory :group do
    name            { Faker::GameOfThrones.house}
    created_at      { Faker::Time.between(7.days.ago, Date.today, :all) }
    updated_at      { Faker::Time.between(2.days.ago, Date.today, :all)}
  end
end
