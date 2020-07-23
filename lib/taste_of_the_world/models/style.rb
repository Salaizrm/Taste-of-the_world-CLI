module TasteOfTheWorld
  class Style

    attr_accessor :style, :style_url

    @@all = []

    def initialize(style, style_url)
      @style = style
      @style_url = style_url
      @@all << self
    end

    def self.all
      @@all
    end

    def self.print_style
      all.each.with_index(1) do |name, index|
        puts ""
        puts "#{index}. #{name.style}"
      end
    end


  end
end
