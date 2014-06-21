json.array!(@members) do |member|
  json.extract! member, :id, :family_id, :first_name, :middle_name, :last_name
  json.url member_url(member, format: :json)
end
