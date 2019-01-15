# frozen_string_literal: true

class CreateDataHalls < ActiveRecord::Migration[5.2]
  def change
    create_table :data_halls do |t|
      t.string :title, null: false
      t.text :description
      t.belongs_to :data_hall_report, foreign_key: true

      t.timestamps
    end
  end
end
