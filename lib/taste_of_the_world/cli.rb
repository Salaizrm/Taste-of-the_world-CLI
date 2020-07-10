module TasteOfTheWorld
  class CLI

    def start
      #=> I want this to call TasteOfTheWorld::Scraper to scrape the most recent data
      # list_cuisines (DO NOT HARD CODE menu)
      menu
    end

    def scrape
      TasteOfTheWorld::Scraper.cuisines
    end


    def controls
      @input = nil
      while @input != "exit"
        @input = gets.strip.downcase
        case @input
          when "menu"
            menu
          when "exit"
            puts "goodbye"
          end
        end
      end

    def menu
      scrape
      print_cuisine
      controls

      # "Hello, Welcome to Taste Of The World."
      # "Please select a cuisine you'd like to make."
      @input = gets.strip

      dish = TasteOfTheWorld::Cuisine.find(@input.to_i)

      print_dishes(dish)

      # #=> dishes will vary by the first option selected.
      # # "What kind of dish would you like to make?"
      # # ------------------------------------------
      # # 1. Authentic Mexican Recipes
      # # 2. Mexican Appetizers
      # # 3. Mexican Main Dishes
      # # 4. Mexican Drinks
      # # 5. Mexican Deserts
      # # ------------------------------------------
      # # "Please select the kind of dish you'd like to make."
      # input = gets.strip
      #
      # recipes = TasteOfTheWorld::Recipes.recipes.find(input.to_i)
      #
      # print_recipes(recipes)

    end

    def print_cuisine
      puts("Hello, Welcome to Taste Of The World.")
      TasteOfTheWorld::Scraper.cuisines.each.with_index(1) do |name, index|
        puts "#{index}. #{name}"
      end
      puts("Please select a cuisine you'd like to make.")
    end

    def print_dishes(dish)
      puts ("What kind of dish would you like to make?")
      TasteOfTheWorld::Cuisine.all.each.with_index(1) do |name, index|
        puts "#{index}. #{name.dishes}"
      end
      puts("Please select the kind of dish you'd like to make.")
      #=> dishes will vary by the first option selected.
      # "What kind of dish would you like to make?"
      # ------------------------------------------
      # 1. Authentic Mexican Recipes
      # 2. Mexican Appetizers
      # 3. Mexican Main Dishes
      # 4. Mexican Drinks
      # 5. Mexican Deserts
      # ------------------------------------------
      # "Please select the kind of dish you'd like to make."
    end

    # def print_recipes(recipes)
    #   puts "Select a recipe you'd like to view"
    #   puts -----------------------------------------
    #   TasteOfTheWorld::Recipes.each.with_index(recipes) do |recipe, index|
    #     puts "#{index}. #{recipe}"
    #   end
      #=> list 0f available recipes will vary from the first and second option.
      # "Select a recipe you'd like to view"
      # -----------------------------------------
      # 1. enchiladas
      # 2. tacos
      # 3. churros
      # 4. carne asada
      # -----------------------------------------

    # def print_recipe(r)
    #   puts <<-RECIPE
    #   -----------------------------------------
    #   NAME: #{r.name}
    #   Chef: #{r.chef}
    #   Rating: #{r.rating}
    #   Number of Ratings: #{r.n_ratings}
    #   Description: #{r.description}
    #   -----------------Basic info--------------
    #   Prep: #{r.prep_time}
    #   Cook: #{r.cook_time}
    #   servings: #{r.servings}
    #   -----------------Ingredients-------------
    #   #{r.ingredientse}
    #   -----------------Directions--------------
    #   #{r.directions}
    #   -----------------Nutrition Facts---------
    #   Per Serving: #{r.nutrition}
    #   -----------------------------------------
    #   "To return to the previous selections type "return". To return to the main menu type "menu". To close this application type "exit""
    #   RECIPE
    #   #=> recipes will vary from first, second and third option.
    #   # -----------------------------------------
    #   # NAME: Enchiladas
    #   # Chef: PattiVerde
    #   # Rating: 4.7
    #   # Number of Ratings: 400
    #   # Short Description: "these are delicious"
    #   # -----------------Basic info--------------
    #   # Prep: 45 min
    #   # Cook: 35 min
    #   # servings: 4
    #   # -----------------Ingredients-------------
    #   # 2 chicken
    #   # etc.
    #   # -----------------Directions--------------
    #   # step 1
    #   # Cook ingredients
    #   #
    #   # step 2
    #   # etc.
    #   # -----------------Nutrition Facts---------
    #   # Per Serving:
    #   # 559.4 calories; 37.1 g protein; 48.9 g carbohydrates; 84 mg cholesterol; 1344 mg sodium.
    #   # -----------------------------------------
    #   # "To return to the previous selections type "return". To return to the main menu type "menu". To close this application type "exit""
    # end
    #
  end
end
