class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  belongs_to :category

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where('level > 5') }
  scope :by_category, ->(category) {
    joins(:category)
      .where(category: { title: category })
  }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than_or_equal_to: 0 }

  def self.titles_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
