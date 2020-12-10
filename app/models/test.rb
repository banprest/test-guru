class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category

  def self.test_and_its_category(title)
    joins('JOIN categories ON category_id = categories.id').where("categories.title = ? ", title).order('tests.id DESC').pluck(:title)
  end
end
