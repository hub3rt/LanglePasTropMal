class Annonce < ActiveRecord::Base

	def self.validate_zip_code(zipcode)
		if zipcode.length == 5 or zipcode.length == 0
			return true
		else
			return false
		end
	end

end
