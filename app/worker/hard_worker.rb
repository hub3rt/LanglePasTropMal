require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HardWorker
  include Sidekiq::Worker

  def self.perform(url)
  	
    data = Nokogiri::HTML(open(url))
	   offres = data.css('.lbc')

    # Récupérer la date et l'heure de la dernière annonce

	   puts offres.first.css('.date').text

	   # Vérifier si l'annonce la plus récente date d'aujourd'hui

	   puts offres.first.css('.date').text.include? "Aujourd'hui"

  end
end