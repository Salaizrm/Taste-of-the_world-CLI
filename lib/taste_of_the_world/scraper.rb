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

  end
end
