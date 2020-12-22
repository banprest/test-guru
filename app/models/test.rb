class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true

  scope :beginer, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :test_and_its_category, ->(title) { joins('JOIN categories ON category_id = categories.id').
                                            where("categories.title = ? ", title) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.test_and_its_category_pluck(title)
    test_and_its_category(title).order('tests.id DESC').pluck(:title)
  end

end
