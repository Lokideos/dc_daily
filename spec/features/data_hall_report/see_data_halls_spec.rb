# frozen_string_literal: true

require 'rails_helper'

feature 'User can see data halls on related data hall report page', "
  In order to check information about data halls
  As a User
  I'd like to be able to see data halls on data hall report page
" do
  given(:data_hall_report) { create(:data_hall_report) }
  given!(:data_hall_list) { create_list(:data_hall, 3, data_hall_report: data_hall_report) }

  scenario 'User see data halls on data hall reports page' do
    visit data_hall_report_path(data_hall_report, lang: 'en')

    data_hall_list.each do |data_hall|
      expect(page).to have_content data_hall.title
      expect(page).to have_content data_hall.description
      expect(page).to have_link 'To Data Hall'
    end
  end
end
