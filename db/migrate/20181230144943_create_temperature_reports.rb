# frozen_string_literal: true

class CreateTemperatureReports < ActiveRecord::Migration[5.2]
  def change
    create_table :temperature_reports do |t|
      t.string :title, null: false
      t.belongs_to :report, foreign_key: true

      t.timestamps
    end
  end
end
