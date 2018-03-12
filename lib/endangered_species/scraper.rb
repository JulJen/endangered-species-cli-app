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

  #   @doc = Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory"))
  #   @doc.search("table.lead.gutter-bottom-2.table-to-list tbody tr").each do |content|
      species = EndangeredSpecies::Species.new

      species.name = content.css("td.keep a").first.text
      species.scientific = content.css("td em").text
      species.status = content.css("td").last.text
      species.url = "https://www.worldwildlife.org#{content.css("a").attr("href").text}"

      @doc = Nokogiri::HTML(open(species.url))
      @doc.search("div.section-inner.shaded-light-checked.section-inner-padded").each do |more_info|
# binding.pry
#         species.summary = more_info.css("p").text
#         species.pop = more_info.css("ico").text
#         species.height = more_info.css("p").text
#         species.weight = more_info.css("p").text
#         species.length = more_info.css("p").text
#         species.habitat = more_info.css("p").text

        species.save
      end
    end
  end

end
