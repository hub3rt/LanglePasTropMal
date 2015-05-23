class Annonce < ActiveRecord::Base

	belongs_to :user
	
	def self.validate_zip_code(zipcode)
		if zipcode.length == 5 or zipcode.length == 0
			return true
		else
			return false
		end
	end

	def maj_date_last_annonce(date)
		self.dateLastAnnonce = date
	end

end
