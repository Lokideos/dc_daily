# frozen_string_literal: true

class DataHall < ApplicationRecord
  belongs_to :data_hall_report

  validates :title, presence: true
end
