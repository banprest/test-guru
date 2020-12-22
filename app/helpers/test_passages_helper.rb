module TestPassagesHelper

  
  def test_result
    result = @test_passage.correct_questions.to_f / @test_passage.test.questions.count * 100.0 
  end

  def num
    nums = 0
  end

  def read_count
  end
end
