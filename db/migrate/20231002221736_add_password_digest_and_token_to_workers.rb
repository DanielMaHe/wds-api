class AddPasswordDigestAndTokenToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :password_digest, :string
    add_column :workers, :token, :string
    add_index :workers, :token, unique: true
  end
end
