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

    def self.get_recipes(recipes_url)
      Nokogiri::HTML(open("#{recipes_url}"))
    end

    def self.get_recipe(recipe_url)
      Nokogiri::HTML(open("#{recipe_url}"))
    end

  end
end
