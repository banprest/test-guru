module QuestionsHelper
  def question_header(question)
    return "#{params[:action].capitalize} #{question.test.title} Question "
  end
end
