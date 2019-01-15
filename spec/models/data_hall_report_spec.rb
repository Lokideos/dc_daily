# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DataHallReport, type: :model do
  it { should have_many :data_halls }
  it { should belong_to :general_report }

  it { should validate_presence_of :title }
end
