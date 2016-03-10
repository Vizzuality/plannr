json.array!(@project_managers) do |project_manager|
  json.extract! project_manager, :id, :name
  json.url project_manager_url(project_manager, format: :json)
end
