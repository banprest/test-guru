class Question < ApplicationRecord
  has_many :answers
  has_many :test_passages
  belongs_to :test

  validates :body, presence: true
  
end
