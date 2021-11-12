# frozen_string_literal: true

# Bookings Controller class
class BookingsController < ApplicationController
  def new
    if params[:flight][:id].nil?
      flash[:alert] = 'Please redo your search and make a selection before booking.'
      redirect_to controller: :flights, action: :index,
                  number_of_passengers: params[:number_of_passengers],
                  flight: {
                    departure_airport_id: params[:flight][:departure_airport_id],
                    arrival_airport_id: params[:flight][:arrival_airport_id],
                    departure_date: params[:flight][:departure_date] }
    else
      @booking = Booking.new
      @number_of_passengers = params[:number_of_passengers]
      @flight = Flight.find(params[:flight][:id])
      @passengers = Booking.create_passengers(@number_of_passengers)
    end
  end

  def create
    @booking = Booking.new(extract_booking_params!)
    if @booking.save
      redirect_to @booking
    else
      render 'new'
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
                                    passengers_attributes: %i[name email])
  end
end
