# frozen_string_literal: true

require 'rails_helper'

feature 'User can delete temperature report', "
  In order to delete not wanted temperature reports
  As a User
  I'd like to be able to delete temperature reports
" do
  given!(:temperature_report) { create(:temperature_report) }

  background { visit temperature_report_path(temperature_report, lang: 'en') }

  scenario 'User deletes the temperature report' do
    click_on 'Delete Temperature Report'

    expect(page).to have_content 'Temperature Report has been successfully deleted.'
    expect(page).to_not have_content temperature_report.title
  end
end
