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


  end
end
