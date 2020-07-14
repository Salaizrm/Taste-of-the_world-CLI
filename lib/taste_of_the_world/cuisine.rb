module TasteOfTheWorld
  class Cuisine

    attr_accessor :name, :rating, :description, :info, :ingredients, :directions, :nutrition
    # :name, :chef, :rating, :n_ratings, :description, :summary, :ingredients, :directions, :nutrition
    #=> Summary includes prep time, cooking time, and servings

    @@all = []

    def initialize(name=nil,rating=nil,description=nil,info=nil,ingredients=nil,directions=nil,nutrition=nil)
      @name = name
      @rating = rating
      @description = description
      @info = info
      @ingredients = ingredients
      @directions = directions
      @nutrition = nutrition
      @@all << self
    end

    def self.all
      @@all
    end

    def self.recipe(recipe)
      TasteOfTheWorld::Scraper.get_recipe(recipe).css("div[class='recipe-content two-col-content karma-main-column']").map do |r|
        name = r.css("h1").text
        rating = r.css("span[class='review-star-text']").first.text.strip
        description = r.css("p[class='margin-0-auto']").text
        info = r.css("div[class='recipe-meta-item']").text.strip.gsub(/\s+/,' ')
        ingredients = r.css("fieldset[class='ingredients-section__fieldset']").text.strip.gsub(/\s+/,' ')
        directions = r.css("fieldset[class='instructions-section__fieldset']").text.strip.gsub(/\s+/,' ')
        nutrition = r.css("section[class='nutrition-section container']").text.strip.gsub(/\s+/,' ')
        self.new(name,rating,description,info,ingredients,directions,nutrition)
      end
    end

  end
end
