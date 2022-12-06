

input = File.read('input.txt')

input.length.times do |i|
  char_map = {}
  4.times do |j|
    char_map[input[i+j]] = j
  end
  p i+4 and break unless char_map.length < 4
end