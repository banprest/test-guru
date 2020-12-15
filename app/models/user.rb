class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test'

  validates :mail, presence: true

  def pass_test(level)
    tests.where(level: level)
  end
end
