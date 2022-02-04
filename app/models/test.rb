class Test < ApplicationRecord
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  belongs_to :category

  def self.test_titles_by_category(category)
    Test.joins(:category)
        .where(category: { title: category })
        .order(title: :desc)
        .pluck(:title)
  end
end
