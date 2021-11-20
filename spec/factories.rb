FactoryBot.define do
  factory :flight do
    departure_airport_id { 1 }
    arrival_airport_id { 2 }
    departure_date { '01/11/2021' }
  end
end