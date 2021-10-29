# frozen_string_literal: true

# Flights Helper module
module FlightsHelper
  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def format_time(time)
    time.strftime("%d/%m/%Y")
  end
end
