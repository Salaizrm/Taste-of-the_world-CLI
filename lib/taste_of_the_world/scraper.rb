class TasteOfTheWorld::Scraper

  def self.get_page
    doc = Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
    cod = Nokogiri::HTML(open("https://www.theworlds50best.com/list/1-50-winners"))
    binding.pry
  end

  def self.cuisines
    self.doc.css("div[class='grid slider'] a")
    #=> This should grab name("mexican recipes") and url ("https://www.allrecipes.com/recipes/728/world-cuisine/latin-american/mexican/")
  end

  def self.get_dishes
  end


end
# self.get_page.css("div[data-list='1-50'] a.item")
# <div data-list="1-50"
# <span class="category-title ng-isolate-scope" data-ellipsis="">Mexican Recipes</span>
# cuisine = doc.css("div[class='grid slider'] span")
