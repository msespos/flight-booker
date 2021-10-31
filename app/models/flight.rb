# frozen_string_literal: true

# Flight class
class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings

  def self.find_flights(search_criteria)
    Flight.all.where(departure_airport_id:
                       search_criteria[:departure_airport_id],
                     arrival_airport_id:
                       search_criteria[:arrival_airport_id],
                     departure_date:
                       search_criteria[:departure_date].to_datetime)
  end
end
