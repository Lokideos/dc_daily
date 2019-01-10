# frozen_string_literal: true

class GeneralReport < ApplicationRecord
  validates :title, presence: true

  has_many :temperature_reports, dependent: :destroy
end
