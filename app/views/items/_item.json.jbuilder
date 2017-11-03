json.extract! item, :id, :name, :title, :description, :price, :main_image, :table_id, :active, :created_at, :updated_at
json.url item_url(item, format: :json)
