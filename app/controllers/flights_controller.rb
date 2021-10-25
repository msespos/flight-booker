# frozen_string_literal: true

# flights controller class
class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |f| [f.code, f.id] }
    @passenger_options = [1, 2, 3, 4]
    @flight = Flight.new
  end
end
