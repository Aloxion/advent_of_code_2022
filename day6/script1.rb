
(input = File.read('input.txt')).length.times do |i|
  char_map = {}
  4.times {|j| char_map[input[i+j]] = j }
  p i+4 and break unless char_map.length < 4
end



