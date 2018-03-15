# Get data and zip it up
# instantiate Species or Articles based on user input from CLI controller

class EndangeredSpecies::Scraper

  def get_species_index
    Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory"))
  end

  def scrape_species_index
    self.get_species_index.css("table.lead.gutter-bottom-2.table-to-list tbody tr")
  end

  def make_species
    scrape_species_index.each do |content|
      species = EndangeredSpecies::Species.new

      species.name = content.css("td.keep a").first.text
      species.scientific = content.css("td em").text
      species.status = content.css("td").last.text
      species.url = "https://www.worldwildlife.org#{content.css("a").attr("href").text}"

      @doc = Nokogiri::HTML(open(species.url))
      @doc.search("div.wrapper.section-pop").each do |more_info|
        species.summary = more_info.css("p").text
        species.habitat = more_info.css("ul.list-data.list-spaced > li").text.gsub("\n\n", " ").gsub("\n", "").gsub("Places","Places:").gsub("Habitats", "\nHabitats:")
        species.save
      end
    end
  end

  def get_articles_index
    Nokogiri::HTML(open("https://www.worldwildlife.org/stories/"))
  end

  def scrape_articles_index
    self.get_articles_index.css("div.span9.gutter-horiz-in")
  end

  def make_articles
    scrape_articles_index.each do |content|
      articles = EndangeredSpecies::Articles.new
      articles.title = content.css("h2 a").text
      articles.date = content.css("em").text.gsub("WWF Magazine:","")
      articles.summary = content.css("div").text.gsub("\n","")
      articles.url = "https://www.worldwildlife.org#{content.css("a").attr("href").text}"
      articles.save
    end
  end
end
