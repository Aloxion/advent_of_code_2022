

input = File.read('input.txt')

input.length.times do |i|
  char_map = {}
  14.times do |j|
    char_map[input[i+j]] = j
  end
  p i+14 and break unless char_map.length < 14
end