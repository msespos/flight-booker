FactoryBot.define do
  factory :flight do
    trait :departing_from_BUR do
      departure_airport_id { 1 }
    end

    trait :arriving_at_LAX do
      arrival_airport_id { 2 }
    end

    trait :departing_nov_1_2021 do
      departure_date { '01/11/2021' }
    end
  end
end