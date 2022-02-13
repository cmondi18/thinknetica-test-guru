class RefactorUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :email
    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string
  end
end
