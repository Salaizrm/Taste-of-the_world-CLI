module TasteOfTheWorld
  class Recipes

    attr_accessor :cuisine, :url
    # :dishes, :recipes, :full_recipe, :url, :name, :chef, :rating, :n_ratings, :description, :summary, :ingredients, :directions, :nutrition
    #=> Summary includes prep time, cooking time, and servings

    @@all = []

    def initialize(cuisine=nil, url=nil)
      @cuisine = cuisine
      @url = url
      @@all << self
    end

    def self.all
      @@all
    end

    def self.find(id)
      self.all[id-1]
    end

  end
end
