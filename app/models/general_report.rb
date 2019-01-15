# frozen_string_literal: true

class GeneralReport < ApplicationRecord
  has_many :data_hall_reports, dependent: :destroy

  validates :title, presence: true
end
