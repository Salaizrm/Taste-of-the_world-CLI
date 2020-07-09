class TasteOfTheWorld::Recipes

  attr_accessor :cuisine, :dishes, :recipes, :full_recipe, :url, :name, :chef, :rating, :n_ratings, :description, :summary, :ingredients, :directions, :nutrition
  #=> Summary includes prep time, cooking time, and servings
  #=> hopefully having 2 doesnt break anything, using 2 jsut for organiztion sake.

  @@all = []

  def initialize(cuisine=nil,dishes=nil,n_ratings=nil,description=nil,summary=nil, ingredients=nil, directions=nil, nutrition=nil, name=nil, url=nil)
    @name = name
    @chef = chef
    @n_ratings = n_ratings
    @description = description
    @summary = summary
    @ingredients = ingredients
    @directions = directions
    @nutrition = nutrition
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
