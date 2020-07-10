module TasteOfTheWorld
  class CLI

    def start
      menu
    end

    def scrape
      TasteOfTheWorld::Scraper
    end

    def menu
      scrape
      puts"Hello, Welcome to Taste Of The World."
      puts"-------------------------------------"
      print_categories
      puts"-------------------------------------"
      puts"Please select a cuisine you'd like to make."
      # "Hello, Welcome to Taste Of The World."

      # "Please select a cuisine you'd like to make."


      input = gets.strip.to_i
      category_url = @category_url[input-1]
      puts"Please Select a style of dish to make."
      puts"-------------------------------------"
      print_style(category_url)
      puts"-------------------------------------"



      # #=> dishes will vary by the first option selected.
      # # "Please select the kind of dish you'd like to make."

    end

    def print_categories
      @category = []
      @category_url = []
    TasteOfTheWorld::Scraper.get_category.css("div[class='grid slider'] a").each do |r|
        category = r.text.strip
        category_url = r['href']
        @category << category
        @category_url << category_url
      end
      @category.each.with_index(1) do |name, index|
        puts "#{index}. #{name}"
      end
    end

    def print_style(category_url)
      @style = []
      @style_url = []
    TasteOfTheWorld::Scraper.get_style(category_url).css("div[class='grid slider'] a").each do |r|
        style = r.text.strip
        style_url = r['href']
        @style << style
        @style_url << style_url
      end
      @style.each.with_index(1) do |name, index|
        puts "#{index}. #{name}"
      end
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

    def print_recipe(r)
      puts <<-RECIPE
      -----------------------------------------
      NAME: #{r.name}
      Rating: #{r.rating}
      Description: #{r.description}
      -----------------Basic info--------------
      INFO: #{r.info}
      -----------------Ingredients-------------
      #{r.ingredients}
      -----------------Directions--------------
      #{r.directions}
      -----------------Nutrition Facts---------
      #{r.nutrition}
      -----------------------------------------
      "To return to the previous selections type "return". To return to the main menu type "menu". To close this application type "exit""
      RECIPE
    end
      #=> recipes will vary from first, second and third option.
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
    #
  end
end
