module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "#{params[:action].capitalize} #{question.test.title} Question "
    else
      "Create New #{question.test.title} Question "
    end
  end
end
