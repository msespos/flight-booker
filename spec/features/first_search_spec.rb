# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Perform the first search', type: :feature do
  xscenario 'with defaults' do
    visit root_path
    click_on 'Search!'
    expect(page).to have_content('No flights found')
  end

  xscenario 'with defaults except arrival airport LAX' do
    visit root_path
    select 'LAX', from: 'flight_arrival_airport_id'
    click_on 'Search!'
    expect(page).to have_content('BUR LAX 01/11/2021')
  end
end
