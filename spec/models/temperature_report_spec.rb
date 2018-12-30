# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TemperatureReport, type: :model do
  it { should validate_presence_of :title }
  it { should belong_to :report }
end
