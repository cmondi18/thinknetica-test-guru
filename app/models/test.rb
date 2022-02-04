class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  def self.test_titles_by_category(category)
    Test.joins(:category)
        .where(category: { title: category })
        .order(title: :desc)
        .pluck(:title)
  end
end
