# frozen_string_literal: true

class RenameTemperatureReportsToDataHallReports < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :temperature_reports, :data_hall_reports
  end

  def self.down
    rename_table :data_hall_reports, :temperature_reports
  end
end
