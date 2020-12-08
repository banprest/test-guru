class Test < ApplicationRecord

  def self.test_and_its_category(title)
    select(:title).joins('JOIN categories ON category_id = categories.id').where("categories.title = ? ", title).order('tests.id DESC')
  end
end
