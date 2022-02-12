class RefactorUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :email
    add_column :users, :password_digest, :string
  end
end
