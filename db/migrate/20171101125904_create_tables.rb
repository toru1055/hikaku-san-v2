class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :title
      t.text :description
      t.text :hero_image

      t.timestamps
    end
  end
end
