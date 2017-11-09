class AddImagesToColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :columns, :image_src, :text
    add_column :columns, :reference_url, :text
  end
end
