# frozen_string_literal: true

class GeneralReport < ApplicationRecord
  validates :title, presence: true

  has_many :data_hall_reports, dependent: :destroy
end
