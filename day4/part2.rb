
overlap = 0
File.open('input.txt').readlines(chomp:true).each do |section|
  sections = section.split(",")
  map = sections[0].split("-")
  left = [].append(map[0]).append(map[1]).map(&:to_i)
  map = sections[1].split("-")
  right = [].append(map[0]).append(map[1]).map(&:to_i)
  if left[0] >= right[0] && left[0] <= right[1] || left[1] >= right[0] && left[1] <= right[1]
    overlap += 1
  elsif right[0] >= left[0] && right[0] <= left[1] || right[1] >= left[0] && right[1] <= left[1]
    overlap += 1
  end
end
p overlap
