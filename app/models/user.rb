class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: :user_id, class_name: 'Test'

  validates :username, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
