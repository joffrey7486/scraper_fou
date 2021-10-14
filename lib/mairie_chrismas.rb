require 'rubygems'
require 'nokogiri'
require 'open-uri'


PAGE_URL_VAL_D_OISE = "https://www.annuaire-des-mairies.com/val-d-oise.html"

townhalls_urls = Nokogiri::HTML(URI.open(PAGE_URL_VAL_D_OISE))

def get_all_href(townhalls_urls)
    all_urls = townhalls_urls.xpath('//a[@class="lientxt"]/@href').to_a
    all_urls.flatten!
    all_urls.map.each {|url| url.value.delete_prefix(".").prepend("https://www.annuaire-des-mairies.com")}
end

def page_scrapper(url)
    Nokogiri::HTML(URI.open(url))
end

def get_townhall_email(url) 
    town_name = url.xpath('/html/body/div/main/section[1]/div/div/div/h1').text.split.first.capitalize
    town_email = url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    array = {town_name => town_email}
end

def get_all_results(all_urls)
    array = []
    all_urls[0..20].each do |url|
        page = page_scrapper(url)
        array << get_townhall_email(page)
    end
    array

end

def perform(townhalls_urls)
    all_urls = get_all_href(townhalls_urls)
    get_all_results(all_urls)
end

perform(townhalls_urls)