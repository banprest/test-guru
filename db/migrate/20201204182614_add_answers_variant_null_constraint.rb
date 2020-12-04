class AddAnswersVariantNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :variant, false)
  end
end
