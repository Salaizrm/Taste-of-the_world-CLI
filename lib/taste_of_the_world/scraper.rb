module TasteOfTheWorld
  class Scraper

    def self.get_category
      Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
    end

    def self.get_style(category_url)
      Nokogiri::HTML(open("#{category_url}"))
    end

    def self.get_recipes(recipes_url)
      Nokogiri::HTML(open("#{recipes_url}"))
    end

    def self.get_recipe(recipe)
      Nokogiri::HTML(open("#{recipe}"))
    end

    def self.recipe
      self.get_recipe(recipe).css("div[class='recipe-content two-col-content karma-main-column']").map do |r|
        name = r.css("h1").text
        rating = r.css("span[class='review-star-text']").first.text.strip
        description = r.css("p[class='margin-0-auto']").text
        info = r.css("div[class='recipe-meta-item']").text.strip.gsub(/\s+/,' ')
        ingredients = r.css("fieldset[class='ingredients-section__fieldset']").text.strip.gsub(/\s+/,' ')
        directions = r.css("fieldset[class='instructions-section__fieldset']").text.strip.gsub(/\s+/,' ')
        nutrition = r.css("section[class='nutrition-section container']").text.strip.gsub(/\s+/,' ')
        TasteOfTheWorld::Cuisine.new(name,rating,description,info,ingredients,directions,nutrition)
      end
    end
  end
end
