# frozen_string_literal: true

class Report < ApplicationRecord
  validates :title, presence: true

  has_many :temperature_reports, dependent: :destroy
end
