# frozen_string_literal: true

class DataHallReport < ApplicationRecord
  validates :title, presence: true

  belongs_to :general_report
end
