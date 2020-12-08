class Test < ApplicationRecord

  def self.test_and_its_category(title)
    joins('JOIN categories ON category_id = categories.id').where("categories.title = ? ", title).order('id DESC')
  end
end
