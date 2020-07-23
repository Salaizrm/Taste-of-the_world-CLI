module TasteOfTheWorld
  class Category

    attr_accessor :category, :category_url

    @@all = []

    def initialize(category, category_url)
      @category = category
      @category_url = category_url
      @@all << self
    end

    def self.all
      @@all
    end

    def self.print_category
      TasteOfTheWorld::Scraper.scrape_category
      all.each.with_index(1) do |name, index|
        puts ""
        puts "#{index}. #{name.category}"
      end
    end

  end
end
