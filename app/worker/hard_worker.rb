require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HardWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options :queue => :default

  recurrence { minutely }

  def perform
    User.all.each do |user|
      user.annonces.each do |annonce|
        url = (annonce.urlRecherche)
        data = Nokogiri::HTML(open(url))
         offres = data.css('.lbc')

        # Récupérer la date et l'heure de la dernière annonce

         puts offres.first.css('.date').text

         # Vérifier si l'annonce la plus récente date d'aujourd'hui

         if annonce.dateLastAnnonce != nil
           if offres.first.css('.date').text.include? "Aujourd'hui"
            if DateTime.now.day.to_i < annonce.dateLastAnnonce.day.to_i
              annonce.update_column :dateLastAnnonce, DateTime.now
              Mailer.nouvelleAnnonce(user, annonce.urlRecherche).deliver_now
            else
              moment = offres.first.css('.date').text[/\d{2}:\d{2}/]

              heuredp = moment[/\d{2}:/]

              heure = heuredp[/\d{2}/]

              if heure.to_i > annonce.dateLastAnnonce.hour
                annonce.update_column :dateLastAnnonce, DateTime.now
                Mailer.nouvelleAnnonce(user, annonce.urlRecherche).deliver_now
              else
                minutedp = moment[/:\d{2}/]

                minute = minutedp[/\d{2}/]

                if minute.to_i > annonce.dateLastAnnonce.minute
                  annonce.update_column :dateLastAnnonce, DateTime.now
                  Mailer.nouvelleAnnonce(user, annonce.urlRecherche).deliver_now
                end
              end
            end
           end
         else
          annonce.update_column :dateLastAnnonce, DateTime.now
         end
          puts annonce.dateLastAnnonce
      end
    end
  end
end