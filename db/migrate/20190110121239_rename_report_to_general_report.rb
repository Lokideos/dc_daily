# frozen_string_literal: true

class RenameReportToGeneralReport < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :reports, :general_reports
    rename_column :temperature_reports, :report_id, :general_report_id
  end

  def self.down
    rename_table :general_reports, :reports
    rename_column :temperature_reports, :general_report_id, :report_id
  end
end
