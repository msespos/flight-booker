# frozen_string_literal: true

# Flights Controller class
class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |f| [f.code, f.id] }
    @passenger_options = [1, 2, 3, 4]
    @flight = Flight.new
    @found_flights = found_flights
  end

  def found_flights(search_criteria)
    return nil if params[:flight].nil?

    Flight.find_flights(search_criteria)
  end

  def search_criteria
    { departure_airport_id: params[:flight][:departure_airport_id],
      arrival_airport_id: params[:flight][:arrival_airport_id],
      departure_datetime: params[:flight][:departure_datetime] }
  end
end
