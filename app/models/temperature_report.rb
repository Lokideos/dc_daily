# frozen_string_literal: true

class TemperatureReport < ApplicationRecord
  validates :title, presence: true

  belongs_to :report
end
