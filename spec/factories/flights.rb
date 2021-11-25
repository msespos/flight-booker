# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

FactoryBot.define do
  factory :flight do
    departure_date { '' }
    departure_airport_id { '' }
    arrival_airport_id { '' }
    duration { '' }
    departure_time { '2000-01-01 12:00:00 UTC' }

    trait :departing_on_nov1 do
      departure_date { '01/11/2021' }
    end

    trait :departing_on_nov2 do
      departure_date { '02/11/2021' }
    end

    trait :departing_on_nov3 do
      departure_date { '03/11/2021' }
    end

    trait :departing_from_BUR do
      departure_airport_id { 1 }
    end

    trait :departing_from_LAX do
      departure_airport_id { 2 }
    end

    trait :arriving_at_LAX do
      arrival_airport_id { 2 }
    end

    trait :arriving_at_BOS do
      arrival_airport_id { 4 }
    end
  end
end

# rubocop:enable Metrics/BlockLength
