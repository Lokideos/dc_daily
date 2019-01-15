# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DataHall, type: :model do
  it { should belong_to :data_hall_report }

  it { should validate_presence_of :title }
end
