class AddColumnsToTable < ActiveRecord::Migration[5.1]
  def change
    add_column :tables, :active, :boolean
    add_column :tables, :annotation, :text
  end
end
