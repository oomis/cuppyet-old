json.extract! post, :id, :user_id, :name, :item, :location, :image, :category, :desc, :created_at, :updated_at
json.url post_url(post, format: :json)
