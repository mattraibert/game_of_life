require 'gosu'
require 'gol/world'

FPS = 3

class Window < Gosu::Window
  def initialize(world)
    super(1200, 700, false)
    self.caption = "Gosu Tutorial Game"
    @animation = Gosu::Image.new(self, "./white_pixel.png", true)

    @world = world
    @stars = world.data.each_with_index.map do |stripe, row|
      stripe.each_with_index.map do |it, col|
        Star.new(@animation).tap { |star| star.warp(col, row) }
      end
    end
  end

  def draw
    @world.tick
    @stars.each_with_index do |stripe, row|
      stripe.each_with_index do |star, column|
        star.draw if @world.point(row, column)
      end
    end
  end
end

class Star
  attr_reader :col, :row

  def initialize(animation)
    @animation = animation
  end

  def warp(col, row)
    @col = col
    @row = row
  end

  def draw
    @animation.draw(@col * 4, @row * 4, 0)
  end
end

