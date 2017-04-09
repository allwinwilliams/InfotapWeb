json.array!(@departments) do |department|
  json.extract! department, :id, :name
  json.url user_department_url(department, format: :json)
end
