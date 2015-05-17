require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = 'http://www.leboncoin.fr/voitures/offres/aquitaine/'
data = Nokogiri::HTML(open(url))
# offres = data.css('.lbc')

# puts offres.first.css('.date').text[/\d{2}:\d{2}/]

# offres.each do |offre|
# 	puts offre.css('.date').text
# end

puts data.css('.search_category').text