class BadgeDistributionService

  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule_name}_award?", badge.rule_value)
    end
  end

  private

  def category_award?(badge_value)
    test_passage_count = TestPassage.where(passed: true).where(test_id: Category.find_by('title = ?', badge_value).tests.pluck(:id), user_id: @user.id).distinct.pluck(:test_id).count
    category_count = Category.find_by('title = ?', badge_value).tests.count
    test_passage_count == category_count
  end

  def level_award?(badge_value)
    test_passage_count = TestPassage.where(passed: true).where(test_id: Test.where('level = ?', badge_value).pluck(:id), user_id: @user.id).distinct.pluck(:test_id).count 
    level_count = Test.where("level = ?", badge_value).count
    test_passage_count == level_count
  end

  def title_award?(badge_value)
    test_passage_passed_count = TestPassage.where(passed: true).where(test_id: Test.find_by('title = ?', badge_value), user_id: @user.id).distinct.pluck(:test_id).count
    test_passage_count = TestPassage.where(test_id: Test.find_by('title = ?', badge_value), user_id: @user.id).count
    title = Test.find_by("title = ?", badge_value)
    test_passage_count == test_passage_passed_count && @test == title
  end
end
