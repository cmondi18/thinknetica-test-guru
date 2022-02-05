class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :created_tests, foreign_key: :user_id, class_name: 'Test'

  validates :username, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
