# frozen_string_literal: true

# This migration creates the 'zoos' table.
class CreateZoos < ActiveRecord::Migration[7.0]
  def change
    create_table :zoos do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :area, null: false
      t.string :prefecture, null: false
      t.string :link, null: false
      t.timestamps
    end
  end
end
