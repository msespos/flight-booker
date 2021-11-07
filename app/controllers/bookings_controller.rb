# frozen_string_literal: true

# Bookings Controller class
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight_id = params[:flight][:id]
    @number_of_passengers = params[:flight][:number_of_passengers]
    @flight = Flight.find(@flight_id)
    @passengers = Booking.create_passengers(@number_of_passengers)
  end

  def create
    @booking = Booking.new(extract_booking_params!)
    if @booking.save
      redirect_to @booking
    else
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  private

    def extract_booking_params!
      params[:booking][:passengers_attributes] = params[:booking][:passenger]
      params[:booking].delete(:passenger)
      params.require(:booking).permit(:flight_id,
                                      passengers_attributes: [:name, :email])
    end
end
