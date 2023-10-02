class AddUniqueIndexToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_index :workers, :username, unique: true
    add_index :workers, :mail, unique: true
  end
end
