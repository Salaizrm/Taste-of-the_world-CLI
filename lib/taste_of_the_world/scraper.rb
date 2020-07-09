module TasteOfTheWorld
  class Scraper

    def self.get_page
      Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
    end

    def self.cuisines
      doc = self.get_page.css("div[class='grid slider'] a").map do |r|
        cuisine = r.text.strip
        url = r['href']
        TasteOfTheWorld::Recipes.new(cuisine, url)
      end
      doc
      binding.pry
    #=> This should grab name("mexican recipes") and url ("https://www.allrecipes.com/recipes/728/world-cuisine/latin-american/mexican/")
    #THIS GRABS ALL URL's get_page.css("div[class='grid slider'] a").map { |link| link['href'] }
    end

    def self.get_dishes

    end


  end
end
#cuisine names: .css("div[class='grid slider'] a")
#cuisine URLs: .css("div[class='grid slider'] a").map {|link| url = link['href']}
