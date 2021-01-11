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

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end