class RemovePartPrixFromAnnonces < ActiveRecord::Migration
  def change
  	remove_column :annonces, :prixMini, :integer
  	remove_column :annonces, :prixMaxi, :integer
  	remove_column :annonces, :typeProduit, :string
  	remove_column :annonces, :region, :string
  	remove_column :annonces, :codePostal, :integer
  	add_column :annonces, :urlRecherche, :string
  end
end
