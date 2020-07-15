module TasteOfTheWorld
  class CLI

    def start
      menu
    end

    def controls
      if input == "exit"
        puts ""
        puts "Goodbye! Hope to assist you again! New recipes may be available next time!"
        exit
      elsif input == ""
        puts ""
        puts "Sorry I dont understand that."
        menu
      end
    end

    def menu
      puts"Hello, Welcome to Taste Of The World."
      puts"-------------------------------------"
      TasteOfTheWorld::Category.print_category
      puts"-------------------------------------"
      puts"Please select a cuisine you'd like to make."

      input = gets.strip
      controls
      category_url = @category_url[input.to_i-1]
      puts""
      puts"Please Select a style of dish to make."
      puts"-------------------------------------"
      TasteOfTheWorld::Category.print_style(category_url)
      puts"-------------------------------------"
      puts"Please Select a style of dish to make."

      input = gets.strip
      controls
      style_url = @style_url[input.to_i-1]
      puts""
      puts"Select a recipe you'd like to make"
      puts"-------------------------------------"
      print_recipes(style_url)
      puts"-------------------------------------"
      puts"Select a recipe you'd like to make"

      @input = gets.strip
      controls
      recipe = @recipes_url[@input.to_i-1]
      print_recipe(recipe)

    end


    def print_recipes(style_url)
      @recipes = []
      @recipes_url = []
    TasteOfTheWorld::Scraper.get_recipes(style_url).css("div[class='fixed-recipe-card__info']").each do |r|
        recipes = r.text.strip.gsub(/\s+/,' ')
        recipes_url = r['href']
        @recipes << recipes
        @recipes_url << recipes_url
      end
      @recipes.each.with_index(1) do |name, index|
        puts ""
        puts "#{index}. #{name}"
      end
    end

    def print_recipe(recipe)
      TasteOfTheWorld::Cuisine.recipe(recipe).each do |r|
        puts""
        puts "-----------------------------------------"
        puts "NAME: #{r.name}"
        puts "Rating: #{r.rating}"
        puts "Description: #{r.description}"
        puts "-----------------Basic info--------------"
        puts "INFO: #{r.info}"
        puts "-----------------Ingredients-------------"
        puts "#{r.ingredients}"
        puts "-----------------Directions--------------"
        puts "#{r.directions}"
        puts "-----------------Nutrition Facts---------"
        puts "#{r.nutrition}"
        puts "-----------------------------------------"
        puts "To return to the previous selections type return. To return to the main menu type menu. To close this application type exit"
    end
  end

  end
end
