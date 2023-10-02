class AddMailToWorker < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :mail, :string
  end
end
