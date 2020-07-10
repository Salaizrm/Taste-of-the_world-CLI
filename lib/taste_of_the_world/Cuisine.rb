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

    def self.find(id)
      self.all[id-1]
    end

  end
end
