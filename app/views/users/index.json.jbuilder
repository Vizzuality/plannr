json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :title, :role
  json.url user_url(user, format: :json)
end
