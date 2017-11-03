class CreateColumns < ActiveRecord::Migration[5.1]
  def change
    create_table :columns do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.belongs_to :type, foreign_key: true
      t.belongs_to :table, foreign_key: true
      t.boolean :not_null
      t.boolean :unique
      t.string :default_value
      t.string :unit

      t.timestamps
    end
  end
end
