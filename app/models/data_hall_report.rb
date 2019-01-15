# frozen_string_literal: true

class DataHallReport < ApplicationRecord
  has_many :data_halls, dependent: :destroy
  belongs_to :general_report

  validates :title, presence: true
end
