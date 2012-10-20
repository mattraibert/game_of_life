require 'gol/rle'

module Toys
  def self.add_arrays(base, template)
    base.each_with_index.map do |stripe, row|
      stripe.each_with_index.map do |it, col|
        (template[row] && template[row][col]) || it
      end
    end
  end

  def self.floater
    [[false, true, false],
     [true, false, false],
     [true, true, true]]
  end

  def self.glider_gun
    [[false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, false, false, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false],
     [false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false],
     [false, true, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, true, true, false, false, false, false, false, false, false, false, true, false, false, false, true, false, true, true, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
     [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]]
  end


  def self.some_gun
    to_a(decode("5boo85boo$5boo85boo$37boo28bo$35bobbo27b4o$22bobo9bo14boo14boobobo$22bo3bo7bo14bobbo11b3obobbobboo$"+
                    "12boo12bo7bo18bo11boobobo3boo$12boo8bo4bo7bobbo14bo12b4o$5bo20bo10boo14bo7bo5bo25bo$4b3o15bo3bo22bobbo"+
                    "9bo29b3o$3b5o14bobo8bobo13boo9b3o28b5o$bbobobobo25boo35boo17bobobobo$bboo3boo25bo37bo17boo3boo$56bo15"+
                    "bobo5boo$55b3o15boo5boo$5bo48bobobo24boo8bo$4bobo3boo42bobobo10bo13b3o7bo$3boobo4bo29bo13b3o9bobo13boo$"+
                    "3b3o5bobo6bobo19boo12bo11boo10boo11bo$bbobbo6boo6bo3bo16boo37boo10boo$bb3o19bo7bo52bo6boboo$bo3bo14bo"+
                    "4bo4b4o22bo28bobo$o5bo17bo4boboboo20b3o27boo$bo3bo5bo8bo3bo3bobbob3o18bobobo17bo14boo3boo$bb3o7bo7bobo"+
                    "6boboboo19bobobo18bo14b5o$10b3o17b4o8boo4bobo4b3o17b3o15b3o$32bo9bobo4boo5bo37bo$21bo22bo4bo28bo$21bobo"+
                    "20boo15boo14bo$21boo37booboo9bobb3o$61b4o8boo$19bo13boo27boo9bobo$17bobo12b4o13boo5bo39boo$18boo12booboo"+
                    "10booboo5boo37bo$3boo17boo10boo11b4o5boo6boo21boo8b3o$3boo18boo23boo15bo14boboo3b3o9bo$12bo9bo38bo3bobo"+
                    "8bobbo3bo5boobo$12bobo44bobo4boo7boobbo4bo4bobbo$oo11bobo9boo28boo3boo12boo5b4o4boobo$oo11bobbo7b3o24"+
                    "boobo18b3o7bo3b3o6boo$13bobo5boboo9boo15boobbobbo4bobo8boo11boo7bobo$12bobo6bobbo4bo5bo20bobo5boo9boo"+
                    "21bo$12bo8boboo5bo26bo6bo11bo21boo$24b3o3bo3bo33bo$25boo5bo23boo11bo$56boo9b3o"))
  end

  def self.empty(cols, rows = cols)
    rows.times.map { cols.times.map { false } }
  end
end