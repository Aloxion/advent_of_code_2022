



rucksack = []
priorities_hash = {}
sum = 0

File.open('input.txt').each_line {|line| rucksack.append(compartments = [].append(line.slice(0, line.length/2)).append(line.slice(line.length/2, line.length)).map(&:chomp))  }
letters = 'abcdefghijklmnopqrstuvwxyz'.each_char.with_index{|char, i| priorities_hash[i+1] = char }
letters.upcase!.each_char.with_index{|char, i| priorities_hash[i+27] = char}
rucksack.each do |comp|
  new_hash = {}
  comp[0].each_char.with_index do |first_char, i|
    new_hash[i+1] = first_char
  end
  p new_hash
  comp[1].each_char do |second_char|
    p comp[1]
    p second_char
    if new_hash.key(second_char).to_i > 0
      sum += priorities_hash.key(second_char).to_i
      p priorities_hash.key(second_char).to_i
      break
    end
  end
end

p sum