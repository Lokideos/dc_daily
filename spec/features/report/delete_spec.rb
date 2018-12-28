# frozen_string_literal: true

require 'rails_helper'

feature 'User can delete the report', "
  In order to delete not wanted report
  As a User
  I'd like to be able to delete the report
" do
  given(:report) { create(:report) }
  background { visit report_path(report) }

  scenario 'User tries to delete the report' do
    click_on 'Delete Report'

    expect(page).to have_content 'Report has been successfully deleted'
    expect(page).to_not have_content report.title
  end
end
