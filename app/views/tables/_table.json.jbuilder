json.extract! table, :id, :title, :description, :hero_image, :created_at, :updated_at
json.url table_url(table, format: :json)
