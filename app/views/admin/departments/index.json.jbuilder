json.array!(@departments) do |department|
  json.extract! department, :id, :name
  json.url admin_department_url(department, format: :json)
end
