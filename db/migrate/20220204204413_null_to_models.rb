class NullToModels < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:tests, :category_id, false)
    change_column_null(:tests, :user_id, false)
    change_column_null(:users_tests, :user_id, false)
    change_column_null(:users_tests, :test_id, false)
  end
end
