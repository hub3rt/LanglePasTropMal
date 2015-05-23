require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = 'http://www.leboncoin.fr/voitures/offres/aquitaine/'
data = Nokogiri::HTML(open(url))
offres = data.css('.lbc')

# Récupérer la date et l'heure de la dernière annonce

puts offres.first.css('.date').text

# Vérifier si l'annonce la plus récente date d'aujourd'hui

puts offres.first.css('.date').text.include? "Aujourd'hui"

# Récupérer l'heure de l'annonce

puts offres.first.css('.date').text[/\d{2}:\d{2}/]

moment = offres.first.css('.date').text[/\d{2}:\d{2}/]

heuredp = moment[/\d{2}:/]

heure = heuredp[/\d{2}/]

puts heure.to_i >= DateTime.now.hour

minutedp = moment[/:\d{2}/]

minute = minutedp[/\d{2}/]

puts minute.to_i >= DateTime.now.minute

# Afficher toutes les dates et heures des annonces de la page

# offres.each do |offre|
# 	puts offre.css('.date').text
# end