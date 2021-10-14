require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Lien pour fichier JSON complet (possiblité de changer limit=300 par n'importe quelle valeur)
# PAGE_URL = "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=300&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false"

PAGE_URL = "https://coinmarketcap.com/all/views/all/"

def page_scrapper(page_url)
  page = Nokogiri::HTML(URI.open(page_url))
end

def data_scrapper(page)
  array = []
  20.times do |x|
    crypto_name =  page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{x + 1}]/td[2]/div/a[1]").text
    crypto_value = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{x + 1}]/td[5]/div/a ").text.delete("$,").to_f
    array << {crypto_name => crypto_value} 
  end
  array
end



def perform(page_url)
  page = page_scrapper(page_url)
  puts data_scrapper(page).inspect
end

perform(PAGE_URL)