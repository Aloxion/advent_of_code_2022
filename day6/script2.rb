
(input = File.read('input.txt')).length.times do |i|
  char_map = {}
  14.times {|j| char_map[input[i+j]] = j }
  p i+14 and break unless char_map.length < 14
end
