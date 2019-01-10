# frozen_string_literal: true

require 'rails_helper'

feature 'User can create temperature general_report', "
  In order to keep updated information about temperature
  As a User
  I'd like to be able to create temperature general_report
" do
  given(:general_report) { create(:general_report) }

  background { visit new_general_report_temperature_report_path(general_report_id: general_report, lang: 'en') }

  scenario 'User creates the general_report' do
    fill_in 'Title', with: 'Temperature Report'
    click_on 'Create Temperature Report'

    expect(page).to have_content 'Temperature report has been successfully created.'
    expect(page).to have_content 'Temperature Report'
  end

  scenario 'User tries to create general_report with invalid attributes' do
    click_on 'Create Temperature Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
