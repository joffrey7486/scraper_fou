require_relative '../lib/dark_trader.rb'

page = page_scrapper("https://coinmarketcap.com/all/views/all/")

describe "the page_scrapper method" do
    it "should return a Nokogiri::HTML4::Document" do
        expect(page.class).to eq (Nokogiri::HTML4::Document)
    end
end

describe "the "

describe "the data_scrapper method" do
    it "should return a no-empty hash in an array" do
        expect(data_scrapper(page).class).to eq(Array)
        expect(data_scrapper(page)[0].class).to eq(Hash)
        expect(data_scrapper(page).empty?).to eq(false)
        expect(data_scrapper(page)[0].empty?).to eq(false)
    end
    it "hash should contains a key in string and a value in float" do
        expect(data_scrapper(page)[0]["BTC"].class).to eq(Float)
    end
end