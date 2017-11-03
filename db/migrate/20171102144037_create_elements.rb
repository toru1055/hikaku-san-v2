class CreateElements < ActiveRecord::Migration[5.1]
  def change
    create_table :elements do |t|
      t.belongs_to :table, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.belongs_to :column, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
