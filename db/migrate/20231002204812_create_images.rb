# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :proyect, null: false, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
