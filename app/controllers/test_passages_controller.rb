class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_test_passage

  def show
    
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end

  def result
    
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    
    if result.present?
      flash_options = { notice: t('.success', link: result.html_url) }
      current_user.gists.create(gist_url: result.html_url, question_body: @test_passage.current_question.body)
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
