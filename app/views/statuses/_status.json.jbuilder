json.extract! status, :id, :name, :desc, :created_at, :updated_at
json.url status_url(status, format: :json)
