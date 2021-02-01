class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :test_passage
  belongs_to :test

  validates :body, presence: true
  
end
