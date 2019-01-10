# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeneralReport, type: :model do
  it { should validate_presence_of :title }
  it { should have_many(:data_hall_reports).dependent(:destroy) }
end
