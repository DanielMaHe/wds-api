# frozen_string_literal: true

class RemovePasswordFromWorkers < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :password, :string
  end
end
