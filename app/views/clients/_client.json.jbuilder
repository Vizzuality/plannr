json.extract! client, :id, :name, :url, :short_name, :created_at, :updated_at
json.url client_url(client, format: :json)