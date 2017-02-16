class ChangeColumnNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :products, :category_id, false
  end
end
