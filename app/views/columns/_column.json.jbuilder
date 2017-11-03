json.extract! column, :id, :name, :description, :priority, :type_id, :table_id, :not_null, :unique, :default_value, :unit, :created_at, :updated_at
json.url column_url(column, format: :json)
