class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test'

  scope :pass_test, ->(level) { tests.where(level: level) }

  validates :mail, presence: true
end
