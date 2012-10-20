def encode(str)
  str.gsub(/(.)\1*/) { $&.length.to_s + $1 }
end

def decode(str)
  str.gsub(/(\d+)(\D)/) { $2 * $1.to_i }
end

def to_a(string)
  string.split(?$).map { |row| row.ljust(100, ?0).each_char.map { |char| {?b => false, ?o => true}[char] } }
end
