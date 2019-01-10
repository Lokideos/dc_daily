# frozen_string_literal: true

require 'rails_helper'

feature 'User can see all General Reports', "
  In order to choose needed General Report
  As a User
  I'd like to be able to see all created General Reports
" do
  given!(:general_reports) { create_list(:general_report, 3) }

  scenario 'User sees all General Reports' do
    visit general_reports_path

    general_reports.each do |general_report|
      expect(page).to have_content general_report.title
    end
  end
end
