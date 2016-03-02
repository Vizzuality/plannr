json.array!(@projects) do |project|
  json.extract! project, :id, :name, :budget, :start_date, :end_date
  json.url project_url(project, format: :json)
end
