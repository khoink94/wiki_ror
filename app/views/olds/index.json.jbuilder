json.array!(@olds) do |old|
  json.extract! old, :id, :articles_id, :title, :content, :created_at, :updated_at, :user_id, :category_id
  json.url old_url(old, format: :json)
end
