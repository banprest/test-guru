class Badge < ApplicationRecord
  belongs_to :user

  validates :title, :image, :rule_name, :rule_value, presence: true

  RULES = [
      {rule_name: :category,
       rule_value: Category.all.pluck(:title)
      },
      {rule_name: :level,
       rule_value: Test.all.distinct.pluck(:level)
      },
      {rule_name: :title,
       rule_value: Test.all.pluck(:title)
      }
    ]
end
