class FeedbackController < ApplicationController

  def new
  end

  def create
    @feedback = params.permit(:title, :text)
    if @feedback.present?
      FeedbackMailer.delive_feedback(@feedback).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      redirect_to new_feedback_path, alert: t('.alert')
    end
  end
end
