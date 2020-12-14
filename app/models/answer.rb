class Answer < ApplicationRecord
  belongs_to :question

  scope :true_answer, -> { where(correct: true) }

  validates :variant, presence: true
  validate :validate_min_answer
  validate :validate_max_answer

  def validate_min_answer
    errors.add(:variant) if question.answers.length < 1
  end

  def validate_max_answer
    errors.add(:variant) if question.answers.length > 3
  end
end
