require 'gosu'
require 'gol/world'

FPS = 3

class Window < Gosu::Window
  def initialize(world)
    super(1200, 700, false)
    self.caption = "Gosu Tutorial Game"
    @animation = Gosu::Image.new(self, "./white_pixel.png", true)

    @world = world
    @stars = world.data.map { |it| it.map { Star.new(@animation) } }
  end

  def update
    #@count ||= 0
    #@count = (@count + 1 % 10)
  end

  def draw
    @world.tick

    @stars.each_with_index do |stripe, row|
      stripe.each_with_index do |star, column|
        star.warp(column, row)
        star.draw if @world.point(row, column)
      end
    end
  end
end

class Star
  attr_reader :x, :y

  def initialize(animation)
    @animation = animation
  end

  def warp(x, y)
    @x = x
    @y = y
  end

  def draw
    @animation.draw(@x * 4, @y * 4, 0)
  end
end

