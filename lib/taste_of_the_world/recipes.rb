class TasteOfTheWorld::Recipes

  attr_accessor :cuisine, :dishes, :recipes, :full_recipe, :url
  attr_accessor :name, :chef, :rating, :n_ratings, :description, :prep_time, :cook_time, :servings, :ingredients, :directions, :nutrition
  #=> hopefully having 2 doesnt break anything, using 2 jsut for organiztion sake.

  @@all = []

  def initialize(name=nil,chef=nil,n_ratings=nil,description=nil, prep_time=nil, cook_time=nil, servings=nil, ingredients=nil, directions=nil, nutrition=nil)
    @name = name
    @chef = chef
    @n_ratings = n_ratings
    @description = description
  end


end
