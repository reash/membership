json.array!(@families) do |family|
  json.extract! family, :id, :name, :main_person
  json.url family_url(family, format: :json)
end
