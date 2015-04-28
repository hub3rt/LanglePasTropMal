json.array!(@annonces) do |annonce|
  json.extract! annonce, :id, :titre, :typeProduit, :prixMini, :prixMaxi, :region, :codePostal
  json.url annonce_url(annonce, format: :json)
end
