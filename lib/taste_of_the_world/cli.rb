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

      input = gets.strip.to_i
      category_url = @category_url[input-1]
      puts"Please Select a style of dish to make."
      puts"-------------------------------------"
      print_style(category_url)
      puts"-------------------------------------"

      input = gets.strip.to_i
      style_url = @style_url[input-1]
      puts"Select a recipe you'd like to make"
      puts"-------------------------------------"
      print_recipes(style_url)

      input = gets.strip.to_i
      recipe = @recipes_url[input-1]
      print_recipe(r)

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
        puts "#{index}. #{name}"
      end
    end

    def print_recipe(recipe)
      TasteOfTheWorld::Cuisine.recipe(recipe).each do |r|
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
