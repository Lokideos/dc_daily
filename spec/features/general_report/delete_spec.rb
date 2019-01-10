# frozen_string_literal: true

require 'rails_helper'

feature 'User can delete the general_report', "
  In order to delete not wanted general_report
  As a User
  I'd like to be able to delete the general_report
" do
  given(:general_report) { create(:general_report) }
  background { visit general_report_path(id: general_report, lang: 'en') }

  scenario 'User tries to delete the general_report' do
    click_on 'Delete General Report'

    expect(page).to have_content 'General Report has been successfully deleted'
    expect(page).to_not have_content general_report.title
  end
end
