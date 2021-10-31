# frozen_string_literal: true

# Bookings Controller class
class BookingsController < ApplicationController
  def new
    @flight_id = params[:flight][:id]
    @number_of_passengers = params[:flight][:number_of_passengers]
    @flight = Flight.find(@flight_id)
    @passengers = Booking.passengers(@number_of_passengers)
  end
end
