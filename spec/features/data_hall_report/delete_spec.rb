# frozen_string_literal: true

require 'rails_helper'

feature 'User can delete Data Hall Report', "
  In order to delete not wanted Data Hall Reports
  As a User
  I'd like to be able to delete Data Hall Reports
" do
  given!(:data_hall_report) { create(:data_hall_report) }

  background { visit data_hall_report_path(data_hall_report, lang: 'en') }

  scenario 'User deletes the Data Hall Report' do
    click_on 'Delete Data Hall Report'

    expect(page).to have_content 'Data Hall Report has been successfully deleted.'
    expect(page).to_not have_content data_hall_report.title
  end
end
