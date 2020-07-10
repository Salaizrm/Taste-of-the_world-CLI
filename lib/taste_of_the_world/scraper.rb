module TasteOfTheWorld
  class Scraper

    def self.get_page
      Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
    end

    def self.cuisines
      url_c = self.get_page.css("div[class='grid slider'] a").map do |r|
        url_category = r['href']
        TasteOfTheWorld::Cuisine.new(url_category)
      end
      c = self.get_page.css("div[class='grid slider'] a").map do |r|
        category = r.text.strip
        TasteOfTheWorld::Cuisine.new(category)
      end
      url_c
      c
      binding.pry
    end

    def self.get_recipe(recipe="https://www.allrecipes.com/recipe/213700/enchiladas-verdes/")
      doc = Nokogiri::HTML(open("#{recipe}"))
    end

    def self.recipe
      doc = self.get_recipe.css("div[class='recipe-content two-col-content karma-main-column']").map do |r|
        name = r.css("h1").text
        TasteOfTheWorld::Cuisine.new(name)
      end
      doc
      binding.pry
    end


#COME BACK TO THIS LATER
    # def self.get_recipes_for(url_style)
    #   Nokogiri::HTML(open("#{url_style}"))
    # end
    #
    # def self.get_style(url_cuisine)
    #   doc_1 = url_cuisine.css("div[class='grid slider'] a").map do |r|
    #     dishes = r.text.strip
    #     url_dishes = r['href']
    #     TasteOfTheWorld::Recipes.new(dishes, url_dishes)
    #   end
    #   doc_1
    #   binding.pry
    # end

  end
end
#cuisine names: .css("div[class='grid slider'] a")
#cuisine URLs: .css("div[class='grid slider'] a").map {|link| url = link['href']}
#dish names: .css("div[class='grid slider'] a")
#dish URLs: .css("div[class='grid slider'] a").map {|link| url = link['href']}

#
