
def get_weapon_score(weapon)
  case weapon
  when "A"
    return 1
  when "B"
    return 2
  when "C"
    return 3
  else
    return
  end
end
def who_won(enemy_answer, my_answer)
  #Draw
  if enemy_answer == my_answer
    return get_weapon_score(my_answer) + Scoring::DRAW
  end
  #Loss Decider
  if enemy_answer == "A" and my_answer == "C"
    get_weapon_score(my_answer) + Scoring::LOST
  elsif enemy_answer == "B" and my_answer == "A"
    get_weapon_score(my_answer) + Scoring::LOST
  elsif enemy_answer == "C" and my_answer == "B"
    get_weapon_score(my_answer) + Scoring::LOST
  #Else win
  else
    get_weapon_score(my_answer) + Scoring::WON
  end
end

Dir.chdir(File.dirname(__FILE__))
module Scoring
  LOST = 0
  DRAW = 3
  WON = 6
end
file = File.open('input.txt')
strategy_map = file.readlines.map(&:chomp)
sum = 0
strategy_map.each do | battle |
  new_map = []
  enemy_choice = ""
  i = 0
  battle.split(" ") do | item |
    if (i == 0)
      enemy_choice = item
      new_map.append(item)
      i += 1
    else
      i -= 1
    end
    if(item == 'X')
      # Lose
      if(enemy_choice == "A")
        new_map.append("C")
      elsif(enemy_choice == "B")
        new_map.append("A")
      elsif(enemy_choice == "C")
        new_map.append("B")
      end
    #Draw
    elsif(item == 'Y')
      new_map.append(enemy_choice)
    elsif(item == 'Z')
      if(enemy_choice == "A")
        new_map.append("B")
      elsif(enemy_choice == "B")
        new_map.append("C")
      elsif(enemy_choice == "C")
        new_map.append("A")
      end
    end
  end
  points = who_won(new_map.at(0), new_map.at(1))
  sum += points
end

puts sum
