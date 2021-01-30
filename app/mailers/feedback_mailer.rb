class FeedbackMailer < ApplicationMailer
  
  def delive_feedback(feedback)
    @admin = Admin.first
    @title = feedback[:title]
    @text = feedback[:text]

    mail to: @admin.email
  end
end
