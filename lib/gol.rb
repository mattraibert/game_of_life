def format(world)
  world.map { |stripe| stripe.map { |x| x == 1 ? ?0 : ' ' }.join }.join "\n"
end

def neighborhood(world, x, y)
  (-1..1).map { |dx| (-1..1).map { |dy| world[x + dx][y + dy] } }
end

def init(size)
  size.times.map { size.times.map { rand 2 }.freeze }.freeze
end
