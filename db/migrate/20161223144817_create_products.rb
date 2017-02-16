class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :category_id
      t.references :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
