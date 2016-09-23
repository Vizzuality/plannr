json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :title, :manages_projects
  json.url user_url(user, format: :json)
end
