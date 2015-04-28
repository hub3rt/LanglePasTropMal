class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :titre
      t.text :description
      t.string :adresse
      t.float :prix_nuit
      t.integer :nbre_place
      t.boolean :wifi

      t.timestamps null: false
    end
  end
end
