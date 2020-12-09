class Test < ApplicationRecord

  def self.test_and_its_category(title)
    joins('JOIN categories ON category_id = categories.id').where("categories.title = ? ", title).order('tests.id DESC').pluck(:title)
  end
end
