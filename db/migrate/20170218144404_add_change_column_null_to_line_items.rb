class AddChangeColumnNullToLineItems < ActiveRecord::Migration[5.0]
  def change
    change_column_null :line_items, :product_id, false, 1
  end
end
