# frozen_string_literal: true

require 'rails_helper'

feature 'User can edit the temperature general_report', "
  In order to fix or edit information about the temperature general_report
  As a User
  I'd like to be able to edit the temperature general_report
" do
  given(:general_report) { create(:general_report) }
  given(:temperature_report) { create(:temperature_report) }

  background { visit edit_temperature_report_path(id: temperature_report, lang: 'en') }

  scenario 'User updates the temperature general_report' do
    fill_in 'Title', with: 'Updated Temperature Report'
    click_on 'Update Temperature Report'

    expect(page).to have_content 'Temperature Report has been successfully updated.'
    expect(page).to have_content 'Updated Temperature Report'
  end

  scenario 'User tries to update the temperature general_report with invalid attributes' do
    fill_in 'Title', with: ''
    click_on 'Update Temperature Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
