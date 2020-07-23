module TasteOfTheWorld
  class CLI

    def start
      menu
    end

    def menu
      puts"Hello, Welcome to Taste Of The World."
      puts"-------------------------------------"
      TasteOfTheWorld::Category.print_category
      puts"-------------------------------------"
      puts"Please select a cuisine you'd like to make."

      input = gets.strip
      if input == "exit"
        exit
      end
      category_url = TasteOfTheWorld::Category.all[input.to_i-1].category_url
      TasteOfTheWorld::Scraper.scrape_style(category_url)


      puts""
      puts"Please Select a style of dish to make."
      puts"-------------------------------------"
      TasteOfTheWorld::Style.print_style
      puts"-------------------------------------"
      puts"Please Select a style of dish to make."

      input = gets.strip
      if input == "exit"
        exit
      end
      style_url = TasteOfTheWorld::Style.all[input.to_i-1].style_url
      TasteOfTheWorld::Scraper.scrape_recipes(style_url)

      puts""
      puts"Select a recipe you'd like to make"
      puts"-------------------------------------"
      TasteOfTheWorld::RecipeList.print_recipes
      puts"-------------------------------------"
      puts"Select a recipe you'd like to make"

      input = gets.strip
      if input == "exit"
        exit
      end
      recipes_url = TasteOfTheWorld::RecipeList.all[input.to_i-1].recipes_url

      TasteOfTheWorld::Scraper.scrape_full_recipe(recipes_url)
      TasteOfTheWorld::FullRecipe.print_full_recipe

      input = nil
        while input != "exit"
          input = gets.strip.downcase
        if input == "exit"
          puts ""
          puts "Goodbye! Hope to assist you again! New recipes may be available next time!"
          exit
        elsif input == "menu"
          menu
        else input == ""
          puts ""
          puts "Sorry I dont understand that."
          menu
        end
      end
    end

  end
end
