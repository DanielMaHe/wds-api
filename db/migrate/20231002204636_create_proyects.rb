# frozen_string_literal: true

class CreateProyects < ActiveRecord::Migration[7.0]
  def change
    create_table :proyects do |t|
      t.string :company
      t.integer :status
      t.text :comment

      t.timestamps
    end
  end
end
