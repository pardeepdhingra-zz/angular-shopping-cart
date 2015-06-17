class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :title
      t.text :description
      t.float :price
      t.string :slug
      t.timestamps null: false
    end
    add_index :products, :sku, :unique => true
    add_index :products, :slug, :unique => true
  end
end
