# frozen_string_literal: true

# Application Mailer class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def confirmation_email(booking)
    passengers = Passenger.where(booking_id: booking.id)
    @url = 'http://example.com'
    passengers.each do |passenger|
      @passenger = passenger
      mail(to: @passenger, subject: 'Thank you for booking!')
    end
  end
end
