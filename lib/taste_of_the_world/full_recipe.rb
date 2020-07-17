
module TasteOfTheWorld
  class FullRecipe

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
      #attributes.each do |k, v|
        #if self.send("#k"=,v)
        #end
      #end
    end

    def self.all
      @@all
    end

    def self.print_full_recipe
      self.all.each do |r|
        puts""
        puts "-----------------------------------------"
        puts "NAME: #{r.name}"
        puts "#{r.rating}"
        puts ""
        puts "Description: #{r.description}"
        puts "-----------------Basic info--------------"
        puts "#{r.info}"
        puts ""
        puts "-----------------Ingredients-------------"
        puts "#{r.ingredients}"
        puts ""
        puts "-----------------Directions--------------"
        puts "#{r.directions}"
        puts ""
        puts "-----------------Nutrition Facts---------"
        puts "#{r.nutrition}"
        puts ""
        puts "-----------------------------------------"
        puts "To return to the main menu type menu. To close this application type exit"
      end
    end

  end
end
