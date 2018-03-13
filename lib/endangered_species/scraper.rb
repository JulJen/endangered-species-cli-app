# require 'pry'
# Need a scraper class
# Get article data and zip it up
# instantiate Species based on data

class EndangeredSpecies::Scraper

  def get_index
    Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory"))
  end

  def scrape_species_index
    self.get_index.css("table.lead.gutter-bottom-2.table-to-list tbody tr")
  end

  def make_species
    scrape_species_index.each do |content|
      species = EndangeredSpecies::Species.new

      species.name = content.css("td.keep a").first.text
      species.scientific = content.css("td em").text
      species.status = content.css("td").last.text
      species.url = "https://www.worldwildlife.org#{content.css("a").attr("href").text}"

      @doc = Nokogiri::HTML(open(species.url))
      @doc.search("div.gutter-top-in-4.gutter-bottom-in-2.gutter-horiz-in").each do |more_info|
        species.summary = more_info.css("p").text
        species.place = more_info.css("div > a:nth-child(1)").text.gsub(/(?<=[a-z])(?=[A-Z])/, ', ')
        species.habitat = more_info.css("div > a:nth-child(2)").text.gsub(/(?<=[a-z])(?=[A-Z])/, ', ')
        species.save
  # binding.pry
      end
    end
  end
end
