require_relative ("../lib/mairie_chrismas.rb")

page = page_scrapper("https://www.annuaire-des-mairies.com/val-d-oise.html")

describe "the page_scrapper method" do
    it "should return a Nokogiri::HTML4::Document" do
        expect(page.class).to eq(Nokogiri::HTML4::Document)
    end
end

all_urls = get_all_href(page)

describe "the get_all_href method" do
    it "should return all urls" do
        expect(all_urls.length).to eq(185)
    end
end

array = get_all_results(all_urls)

describe "the get_all_results method" do
    it "should return a no-empty hash in an array" do
        expect(array.class).to eq(Array)
        expect(array[0].class).to eq(Hash)
        expect(array[5]["Argenteuil"]).to eq("christian.bournery@ville-argenteuil.fr")
    end
end

