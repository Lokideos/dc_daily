# frozen_string_literal: true

require 'rails_helper'

feature 'User can see all general_reports', "
  In order to choose needed general_report
  As a User
  I'd like to be able to see all created general_reports
" do
  given!(:general_reports) { create_list(:general_report, 3) }

  scenario 'User tries to see all general_reports' do
    visit general_reports_path

    general_reports.each do |general_report|
      expect(page).to have_content general_report.title
    end
  end
end
