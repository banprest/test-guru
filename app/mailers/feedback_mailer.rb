class FeedbackMailer < ApplicationMailer
  
  def delive_feedback(feedback)
    @title = feedback[:title]
    @text = feedback[:text]

    mail to: [Admin.first.email, Admin.last.email]
  end
end
