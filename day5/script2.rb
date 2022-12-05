crates = []
input = []
File.open('input.txt').read.split("\n") { |line| input.append(line) }

input.each do |elem|
  if (elem == [])
    break
  else
    crates.append(elem)
  end
end

moves = crates[10..crates.length - 1]

c = [[], [], [], [], [], [], [], [], []]
crates[0..7].each do |crate|
  if crate[0..2] != "   " then
    c[0].append(crate[0..2])
  end
  if crate[4..6] != "   " then
    c[1].append(crate[4..6])
  end
  if crate[8..10] != "   " then
    c[2].append(crate[8..10])
  end
  if crate[12..14] != "   " then
    c[3].append(crate[12..14])
  end
  if crate[16..18] != "   " then
    c[4].append(crate[16..18])
  end
  if crate[20..22] != "   " then
    c[5].append(crate[20..22])
  end
  if crate[24..26] != "   " then
    c[6].append(crate[24..26])
  end
  if crate[28..30] != "   " then
    c[7].append(crate[28..30])
  end
  if crate[32..34] != "   " then
    c[8].append(crate[32..34])
  end
end


moves.each do |string|

  arr = string.split(" ")
  amount = arr[1].to_i
  depart_from = arr[3].to_i
  to_destination = arr[5].to_i

  for i in 0..amount - 1
    c[depart_from-1]
    amount-1-i
    c[to_destination - 1].unshift(c[depart_from - 1][amount-1-i])
  end

  c[depart_from-1] = c[depart_from-1].drop(amount)
end

result = ""
for i in 0..8
  result += c[i][0][1]
end
p result
