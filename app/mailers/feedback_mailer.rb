class FeedbackMailer < ApplicationMailer
  
  def delive_feedback(feedback)
    @title = feedback[:title]
    @text = feedback[:text]

    Admin.find_each do |admin|
      mail to: admin.email
    end
  end
end
