require 'gosu'
require 'gol/world'

class Window < Gosu::Window
  def initialize(world)
    super(1400, 700, false)
    self.caption = "Gosu Tutorial Game"
    @animation = Gosu::Image.new(self, "./white_pixel.png", true)

    @world = world
    @stars = []
    @world.data.each_with_index do |bit, x, y|
      @stars << Star.new(@animation).tap { |star| star.warp(x, y) } if bit == 1
    end
  end

  def update
    @world = @world.tick
    @stars = []
    @world.data.each_with_index do |bit, row, column|
      @stars << Star.new(@animation).tap { |star| star.warp(column, row) } if bit == 1
    end
  end

  def draw
    @stars.each { |star| star.draw }
  end
end

class Star
  attr_reader :x, :y

  def initialize(animation)
    @animation = animation
    #@color = Gosu::Color.new(0xff000000)
    #@color.red = rand(255 - 40) + 40
    #@color.green = rand(255 - 40) + 40
    #@color.blue = rand(255 - 40) + 40
  end

  def warp(x, y)
    @x = x
    @y = y
  end

  def draw
    @animation.draw(@x * 10, @y * 10, 0)
  end
end

