# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def confirmation_email
    @passenger = params[:passenger]
    @url  = 'http://example.com/login'
    mail(to: @passenger.email, subject: 'Thank you for booking!')
  end
end
