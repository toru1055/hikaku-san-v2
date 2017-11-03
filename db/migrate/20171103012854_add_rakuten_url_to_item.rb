class AddRakutenUrlToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :rakuten_url, :text
  end
end
