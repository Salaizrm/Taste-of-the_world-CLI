module TasteOfTheWorld
  class Scraper

    def self.get_page
      Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
    end

    def self.cuisines
      @category = []
    doc = self.get_page.css("div[class='grid slider'] a").each do |r|
        category = r.text.strip
        @category << category
      end
      puts("Hello, Welcome to Taste Of The World.")
      @category.each.with_index(1) do |name, index|
        puts "#{index}. #{name}"
      end
      puts("Please select a cuisine you'd like to make.")
    end

    def self.get_recipe(recipe="https://www.allrecipes.com/recipe/213700/enchiladas-verdes/")
      Nokogiri::HTML(open("#{recipe}"))
    end

    def self.recipe
      doc = self.get_recipe.css("div[class='recipe-content two-col-content karma-main-column']").map do |r|
        name = r.css("h1").text
        rating = r.css("span[class='review-star-text']").first.text.strip
        description = r.css("p[class='margin-0-auto']").text
        info = r.css("div[class='recipe-meta-item']").text.strip.gsub(/\s+/,' ')
        ingredients = r.css("fieldset[class='ingredients-section__fieldset']").text.strip.gsub(/\s+/,' ')
        directions = r.css("fieldset[class='instructions-section__fieldset']").text.strip.gsub(/\s+/,' ')
        nutrition = r.css("section[class='nutrition-section container']").text.strip.gsub(/\s+/,' ')
        TasteOfTheWorld::Cuisine.new(name,rating,description,info,ingredients,directions,nutrition)
      end
      doc
      binding.pry
    end
end
