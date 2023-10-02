class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :username
      t.string :password
      t.boolean :isAdmin

      t.timestamps
    end
  end
end
