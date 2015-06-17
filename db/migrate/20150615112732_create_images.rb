class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true
      t.string :photo
      t.boolean :main, default: false
      t.timestamps null: false
    end
  end
end
