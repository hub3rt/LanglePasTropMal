json.array!(@users) do |user|
  json.extract! user, :id, :nom, :prenom, :mail, :login, :pass
  json.url user_url(user, format: :json)
end
