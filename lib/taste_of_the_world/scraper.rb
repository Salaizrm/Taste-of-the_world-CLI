module TasteOfTheWorld
  class Scraper

    def self.get_category
      Nokogiri::HTML(open("https://www.allrecipes.com/recipes/86/world-cuisine/"))
    end

    def self.scrape_category
    self.get_category.css("div[class='grid slider'] a").each do |r|
        category = r.text.strip
        category_url = r['href']
        TasteOfTheWorld::Category.new(category, category_url)
      end
    end

    def self.get_style(category_url)
      Nokogiri::HTML(open("#{category_url}"))
    end

    def self.scrape_style(category_url)
    self.get_style(category_url).css("div[class='grid slider'] a").each do |r|
        style = r.text.strip
        style_url = r['href']
        TasteOfTheWorld::Style.new(style, style_url)
      end
    end

    def self.get_recipes(style_url)
      Nokogiri::HTML(open("#{style_url}"))
    end

    def self.scrape_recipes(style_url)
    self.get_recipes(style_url).css("div[class='fixed-recipe-card__info']").each do |r|
        recipes = r.css("span[class='fixed-recipe-card__title-link']").text.strip
        recipes_url = r.css("a").map{|x| x['href']}.first
        TasteOfTheWorld::RecipeList.new(recipes, recipes_url)
      end
    end

    def self.get_full_recipe(recipes_url)
      Nokogiri::HTML(open("#{recipes_url}"))
    end

    def self.scrape_full_recipe(recipes_url)
      self.get_full_recipe(recipes_url).css("div[class='recipe-content two-col-content karma-main-column']").each do |r|
        name = r.css("h1").text
        rating = r.css("span[class='review-star-text']").first.text.strip
        description = r.css("p[class='margin-0-auto']").text
        info = r.css("div[class='recipe-meta-item']").text.strip.gsub(/\s+/,' ')
        ingredients = r.css("fieldset[class='ingredients-section__fieldset']").text.strip.gsub(/\s+/,' ')
        directions = r.css("fieldset[class='instructions-section__fieldset']").text.strip.gsub(/\s+/,' ')
        nutrition = r.css("section[class='nutrition-section container']").text.strip.gsub(/\s+/,' ')
        TasteOfTheWorld::FullRecipe.new(name,rating,description,info,ingredients,directions,nutrition)
      end
    end

  end
end
