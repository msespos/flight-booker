# frozen_string_literal: true

# Flights Helper module
module FlightsHelper
  def airport_code(airport_id)
    Airport.find(airport_id).code
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def format_time(time)
    time.strftime('%H:%m%p')
  end
end
