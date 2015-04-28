json.array!(@annonces) do |annonce|
  json.extract! annonce, :id, :titre, :description, :adresse, :prix_nuit, :nbre_place, :wifi
  json.url annonce_url(annonce, format: :json)
end
