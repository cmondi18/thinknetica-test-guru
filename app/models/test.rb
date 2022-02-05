class Test < ApplicationRecord
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  belongs_to :category

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where('level > 5') }
  scope :by_category, ->(category) {
    joins(:category)
      .where(category: { title: category })
      .order(title: :desc)
  }

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.titles_by_category(category)
    by_category(category).pluck(:title)
  end
end
