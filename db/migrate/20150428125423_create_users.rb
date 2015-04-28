class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :mail
      t.string :login
      t.string :pass

      t.timestamps null: false
    end
  end
end
