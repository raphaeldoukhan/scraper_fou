require 'nokogiri'   
require 'open-uri'
require 'pry'

def get_townhall_email(townhall_url)
   page = Nokogiri::HTML(open(townhall_url))
   hash = {"#{page.xpath("/html[1]/body[1]/div[1]/main[1]/section[1]/div[1]/div[1]/div[1]/h1[1]").text}" => page.xpath("/html[1]/body[1]/div[1]/main[1]/section[2]/div[1]/table[1]/tbody[1]/tr[4]/td[2]").text}
   return hash
end

def get_townhall_urls(dept_url)
   page = Nokogiri::HTML(open(dept_url))
   arr = []
   i = 0
   i_max = page.css('a.lientxt').count
   until i == i_max
      arr << "https://www.annuaire-des-mairies.com/#{page.css("a.lientxt")[i]['href'][2..-1]}"
      i+=1
   end
   return arr
end

def perform(dept)
   arr=[]
   get_townhall_urls(dept).map{|i| arr << get_townhall_email(i)}
   return arr
end