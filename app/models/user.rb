class User < ApplicationRecord

  MAIL = /[a-z0-9]@[a-z]+\.[a-z]+/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test'

  validates :mail, presence: true, format: MAIL

  has_secure_password

  def pass_test(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
