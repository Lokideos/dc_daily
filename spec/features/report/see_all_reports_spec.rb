# frozen_string_literal: true

require 'rails_helper'

feature 'User can see all reports', "
  In order to choose needed report
  As a User
  I'd like to be able to see all created reports
" do
  given!(:reports) { create_list(:report, 3) }

  scenario 'User tries to see all reports' do
    visit reports_path

    reports.each do |report|
      expect(page).to have_content report.title
    end
  end
end
