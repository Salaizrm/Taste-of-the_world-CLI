module TasteOfTheWorld
  class Cuisine

    attr_accessor :category, :url_category, :style, :url_style, :name
    # :name, :chef, :rating, :n_ratings, :description, :summary, :ingredients, :directions, :nutrition
    #=> Summary includes prep time, cooking time, and servings

    @@all = []
    def initialize(url_category, category)
      @url_category = url_category
      @category = category
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
