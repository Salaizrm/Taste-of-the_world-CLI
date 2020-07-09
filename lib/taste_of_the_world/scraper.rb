class TasteOfTheWorld::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
    binding.pry
  end

  def index
    self.get_page.css("div")
  end


end

#cuisine:
