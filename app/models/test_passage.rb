class TestPassage < ApplicationRecord

  PERCENTAGE_FOR_PASSING = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create

  scope :passed, -> { where(passed: true) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def counter
    test.questions.order(:id).where('id <= ?', current_question).count
  end

  def change_passed_status
    self.passed = true
    save!
  end

  def test_result
    (self.correct_questions.to_f / self.test.questions.count * 100.0).to_i
  end

  def success?
    test_result >= PERCENTAGE_FOR_PASSING
  end

  def end_time
    (self.created_at + self.test.timer * 60).to_i * 1000
  end

  def time_off?
    end_time <= Time.now.to_i * 1000
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.true_answer
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
