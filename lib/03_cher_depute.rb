require 'nokogiri'   
require 'open-uri'
require 'pry'

def deputes_urls
   page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
   return page.xpath('//td//a/@href').map {|link| "https://www.nosdeputes.fr#{link}"}
end

def deputes_mails(deputes)
   page = Nokogiri::HTML(open(deputes))
   hash = {
      "first_name" => page.css("h1").text.split(" ")[0],
      "last_name" => page.css("h1").text.split(" ")[1..-1],
      "email" => page.xpath('//a[contains(text(),"@assemblee-nationale.fr")]').text,
   }
   return hash
end

def perform
   arr = []
   deputes_urls.map{|i| arr << deputes_mails(i)}
   return arr
end