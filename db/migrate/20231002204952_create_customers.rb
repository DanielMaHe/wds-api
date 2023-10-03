# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :company
      t.text :comment

      t.timestamps
    end
  end
end
