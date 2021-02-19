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
    test_passage_count = TestPassage.passed.joins([test: :category], :user).where(categories: { title: badge_value }, users: { id: @user.id }).distinct.pluck(:test_id).count
    category_count = Test.test_and_its_category(badge_value).count
    test_passage_count == category_count
  end

  def level_award?(badge_value)
    test_passage_count = TestPassage.passed.joins(:test, :user).where(tests: { level: badge_value }, users: { id: @user.id }).distinct.pluck(:test_id).count 
    level_count = Test.where("level = ?", badge_value).count
    test_passage_count == level_count
  end

  def title_award?(badge_value)
    test_passage_passed_count = TestPassage.passed.joins(:test, :user).where(tests: { title: badge_value }, users: { id: @user.id }).distinct.pluck(:test_id).count
    test_passage_count = TestPassage.joins(:test, :user).where(tests: { title: badge_value }, users: { id: @user.id }).pluck(:test_id).count
    title = Test.find_by(title: badge_value)
    test_passage_count == test_passage_passed_count && @test == title
    #Я тут реализовал проверку на первое прохождение если пользователь проходит с первого раза 
    #Ему начисляется бейдж и доп проверку на название теста, чтобы при прохождение любого теста с
    #Первый раз правильно, ему не давали все бейджы. Вроде работает
  end
end
