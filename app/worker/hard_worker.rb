require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HardWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options :queue => :default

  recurrence { minutely }

  def perform
    User.each do |user|
      url = ('http://www.leboncoin.fr/voitures/offres/aquitaine/?f=a&th=1&q=peugeot&location=33300')
      data = Nokogiri::HTML(open(url))
       offres = data.css('.lbc')

      # Récupérer la date et l'heure de la dernière annonce

       puts offres.first.css('.date').text

       # Vérifier si l'annonce la plus récente date d'aujourd'hui

       puts offres.first.css('.date').text.include? "Aujourd'hui"

       Mailer.nouvelleAnnonce(User.first).deliver_now
    end
  end
end