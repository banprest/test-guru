class FeedbackMailer < ApplicationMailer
  
  def delive_feedback(feedback)
    @title = feedback[:title]
    @text = feedback[:text]

    mail to: ENV['SMTP_USERNAME']
  end
end
