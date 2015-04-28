class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :titre
      t.string :typeProduit
      t.integer :prixMini
      t.integer :prixMaxi
      t.string :region
      t.integer :codePostal
      t.datetime :dateLastAnnonce

      t.timestamps null: false
    end
  end
end
