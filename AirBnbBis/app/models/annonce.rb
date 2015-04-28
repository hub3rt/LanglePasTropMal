class Annonce < ActiveRecord::Base
	validates :titre,  :presence => true, :length => {:minimum =>3}
  	validates :adresse, :presence => true
  	validates :prix_nuit, :presence => true

	def self.search(search)
	  if search
	    Annonce.where('titre LIKE ?', "%#{search}%")
	  else
	    Annonce.all
	  end
	end
end