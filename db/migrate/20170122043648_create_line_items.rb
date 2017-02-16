class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :product_id, foreign_key: true
      t.integer :cart_id, foreign_key: true
      t.timestamps
    end
  end
end
