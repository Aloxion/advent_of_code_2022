
rucksacks = []
sum = 0
def find_value(char)
  alphabet = [*'a'..'z', *'A'..'Z']
  alphabet.length.times {|i| return i+1 if alphabet[i] == char }
end

def find_common_char(map)
  first_hash = {}
  second_hash = {}
  map.each do | comp |
    map[index].each_char.with_index do |char, i|
      first_hash[i+1] = char
    end
    map[comp[0]].each_char.with_index do |char, i|
      second_hash[i+1] = char
    end
    #third > first and second
    p map[comp[2]]
    sleep(5)
    map[comp[2]].each_char do |char|
      if first_hash.key(char) and second_hash.key(char)
        sum = find_value(char)
      end
    end


  end

end

File.open('input.txt').each_line {|line| rucksacks.append(compartments = [].append(line).map(&:chomp))}
grouped_rucksacks = []
rucksacks.each_index {|index| grouped_rucksacks.append([rucksacks[index], rucksacks[index+1], rucksacks[index+2],])}
grouped_rucksacks.each {|map| find_common_char(map)}

p sum