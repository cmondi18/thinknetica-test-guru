class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :validate_count_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_count_of_answers
    errors.add[:count_answers] if question.answers.count >= 4
  end
end
