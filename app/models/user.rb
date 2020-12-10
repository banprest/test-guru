class User < ApplicationRecord

  def pass_test(level)
    Test.joins("INNER JOIN user_infos ON test_id = tests.id AND user_id = #{self.id}").where("tests.level = ?", level)
  end
end
