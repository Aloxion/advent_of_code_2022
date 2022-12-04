
def find_value(char)
  alphabet = [*'a'..'z', *'A'..'Z']
  alphabet.length.times {|i| return i+1 if alphabet[i] == char }
end
def find_common_char(map)
  first_hash = {}
  second_hash = {}
  second_map = []
  map.each_with_index  do | comp, index |
    if index == 0
      comp[0].each_char.with_index do |char, i|
        first_hash[i+1] = char
      end
    elsif index == 1
      second_map = comp
      comp[0].each_char.with_index do |char, i|
        second_hash[i+1] = char
      end
    elsif index > 1
      comp[0].each_char do |char|
        if first_hash.key(char) and second_hash.key(char)
          return find_value(char)
        end
      end
    end
  end
  return 0
end

rucksacks = []
sum = 0
File.open('input.txt').each_line {|line| rucksacks.append(compartments = [].append(line).map(&:chomp))}
grouped_rucksacks = []
i = 0
rucksacks.each do
  if i < rucksacks.length
    grouped_rucksacks.append([rucksacks[i], rucksacks[i+1], rucksacks[i+2],])
  end
  i+=3
end
grouped_rucksacks.each {|map| sum += find_common_char(map)}
p sum