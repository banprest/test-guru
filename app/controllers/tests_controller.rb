class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: [:start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.present?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to tests_path, alert: t('.alert')
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
