class TestPassage < ApplicationRecord

  PERCENTAGE_FOR_PASSING = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create

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

  def test_result
    (self.correct_questions.to_f / self.test.questions.count * 100.0).to_i
  end

  def success?
    test_result >= PERCENTAGE_FOR_PASSING
  end

  def all_completed_backend_tests?(user)
    user.tests.where(category_id: Category.find_by(title: 'Backend')).
                              distinct.count == Category.where(title: 'Backend').
                              count
  end

  def all_completed_frontend_tests?(user)
    user.tests.where(category_id: Category.find_by(title: 'Frontend')).
                          distinct.count == Category.where(title: 'Frontend').
                          count
  end   

  def all_completed_level_tests?(user, level)
    user.tests.where("level = ?", level).
                          distinct.count == Test.all.
                          where("level = ?", level).count 
  end
    #Я запутался подскажите пожалуйста. В голове кроме такого решения раздачи бейджов нет
    #И не могу понять как лучше связать правила раздачи и условия

  def distribution_badge(user, test)
    if all_completed_backend_tests?(user)
      user.badges.push(Badge.find_by(rule_value: 'Backend'))
    elsif all_completed_frontend_tests?(user)
      user.badges.push(Badge.find_by(rule_value: 'Frontend'))
    elsif all_completed_level_tests?(user, test.level)
      user.badges.push(Badge.find_by("rule_value = ?", test.level.to_s))
    else
      return
    end
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
