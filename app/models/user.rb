class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def pass_test(level)
    tests.where(level: level)
  end
end
