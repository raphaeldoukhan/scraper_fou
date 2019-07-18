require 'nokogiri'   
require 'open-uri'
require 'pry'

def crypto
page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

a=[]
hash={}
i=1
i_max = page.css('td.no-wrap.currency-name').count

   until i == i_max
      a << hash = {"#{page.xpath("/html/body/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/table/tbody/tr[#{i}]/td[3]").text}" => page.xpath("/html/body/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/table/tbody/tr[#{i}]/td[5]").text.gsub(/[^\d\.]/, '').to_f}
      i+=1
   end
   a
end