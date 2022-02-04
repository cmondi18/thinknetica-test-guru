class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :created_tests, foreign_key: :user_id, class_name: 'Test'

  def tests_by_level(level)
    Test.joins("JOIN users_tests ON tests.id = users_tests.test_id")
        .where('level = ?', level).where('users_tests.user_id = ?', id)
  end
end
