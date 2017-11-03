class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :title
      t.text :description
      t.integer :price
      t.text :main_image
      t.belongs_to :table, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
