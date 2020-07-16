module TasteOfTheWorld
  class Recipes

    attr_accessor :recipes, :recipes_url

    @@all = []

    def initialize(recipes, recipes_url)
      @recipes = recipes
      @recipes_url = recipes_url
      @@all << self
    end

    def self.all
      @@all
    end

    def self.print_style(style_url)
      TasteOfTheWorld::Scraper.scrape_recipes(style_url)
      self.all.each.with_index(1) do |name, index|
        puts ""
        puts "#{index}. #{name.recipes}"
      end
    end

  end
end
