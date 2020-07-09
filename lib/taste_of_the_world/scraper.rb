class TasteOfTheWorld::Scraper

  def self.get_page
    Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
  end

  def self.cuisines
    self.get_page.css("div[class='grid slider'] a").each do |a|
      cuisine = a.text.strip
      TasteOfTheWorld::Recipes.new(cuisine)
    end
     url = self.get_page.css("div[class='grid slider'] a").map {|link| link['href']}
      TasteOfTheWorld::Recipes.new(url)
    binding.pry
    #=> This should grab name("mexican recipes") and url ("https://www.allrecipes.com/recipes/728/world-cuisine/latin-american/mexican/")
    #THIS GRABS ALL URL's doc.css("div[class='grid slider'] a").map { |link| link['href'] }
  end



  def self.get_dishes
  end


end
# cod = Nokogiri::HTML(open("https://www.theworlds50best.com/list/1-50-winners"))
# self.get_page.css("div[data-list='1-50'] a.item")
# <div data-list="1-50"
# <span class="category-title ng-isolate-scope" data-ellipsis="">Mexican Recipes</span>
# cuisine = doc.css("div[class='grid slider'] span")
