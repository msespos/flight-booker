# frozen_string_literal: true

# Flights Controller class
class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |f| [f.code, f.id] }
    @passenger_options = [1, 2, 3, 4]
    @found_flights = find_flights
  end

  def find_flights
    return nil if params[:flight].nil?

    Flight.find_flights(search_criteria)
  end

  def search_criteria
    Rails.logger.debug "CONTROLLER SEARCH CRITERIA PARAMS: #{params}}"
    { departure_airport_id: params[:flight][:departure_airport_id],
      arrival_airport_id: params[:flight][:arrival_airport_id],
      departure_date: params[:flight][:departure_date] }
  end
end
