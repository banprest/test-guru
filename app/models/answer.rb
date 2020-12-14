class Answer < ApplicationRecord
  belongs_to :question

  scope :true_answer, -> { where(correct: true) }

  validates :variant, presence: true
  validate :validate_max_answer

  def validate_max_answer
    errors.add(:variant, 'too many answers') if question.answers.length >= 4
  end
end
