# frozen_string_literal: true

# Flight class
class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def departure_date_formatted
    departure_date.strftime("%d/%m/%Y")
  end

  def self.find_flights(search_criteria)
    found_flights = Flight.all.where(departure_airport_id:
                                       search_criteria[:departure_airport_id],
                                     arrival_airport_id:
                                       search_criteria[:arrival_airport_id],
                                     departure_date:
                                       search_criteria[:departure_date].to_datetime)
  end
end
