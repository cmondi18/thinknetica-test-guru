class ChangeUserTestsToUsersTests < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_tests, :users_tests
  end
end
