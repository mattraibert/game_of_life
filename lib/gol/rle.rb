def encode(str)
  str.gsub(/(.)\1*/) { $&.length.to_s + $1 }
end

def decode(str)
  str.gsub(/(\d+)(\D)/) { $2 * $1.to_i }
end

require 'matrix'

def to_a(string)
  string = string.gsub(?b, ?0).gsub(?o, ?1)
  string.split(?$).map { |row| row.ljust(100, ?0).each_char.map &:to_i }
end

def to_matrix(string)
  Matrix[*to_a(string)]
end
