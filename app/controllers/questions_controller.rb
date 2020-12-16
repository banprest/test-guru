class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create, :new]
  before_action :question_find, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    render json: { questions: @test.questions.all }
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new

  end

  def create
    question = @test.questions.create(question_params)
    if question.save
      render plain: 'Question was create'
    else
      render plain: 'Question was not create'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def question_find
    @question = Question.find(params[:id])
  end
end
