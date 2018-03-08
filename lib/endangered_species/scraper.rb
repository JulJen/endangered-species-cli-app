# require 'pry'
# Need a scraper class
# Get article data and zip it up
# instantiate Species based on data

class EndangeredSpecies::Scraper



  # def scrape_species_page
  #   @doc = Nokogiri::HTML(open(@url))
  #   @doc.search(".wysiwg.lead").text
  # end

  def scrape_species_index
    @doc = Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory"))
    @doc.search("table.lead.gutter-bottom-2.table-to-list tbody tr").each do |content|
      species = EndangeredSpecies::Species.new

      species.name = content.css("td.keep a").first.text
      species.status = "Status: #{content.css("td").last.text}"
      species.url = "More info: https://www.worldwildlife.org#{content.css("a").attr("href").text}"

      species.save
    end
  end

end
