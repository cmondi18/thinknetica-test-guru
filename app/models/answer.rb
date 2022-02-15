class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :validate_count_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_count_of_answers
    errors[:count_answers] << 'Maximum of answers is 4' if question.answers.count >= 4
  end
end
