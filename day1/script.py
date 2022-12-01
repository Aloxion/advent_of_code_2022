with open("input.txt", "r") as f:
    calories = 0
    highCal = 0
    elvesInv = []
    final_result = []

    lines = f.readlines()
    for line in lines:
        if line.strip() == "":
            if (calories > 0):
                elvesInv.append(calories)
            calories = 0
        else:
            calories += int(line)

    for i in range(0, 3):
        highCal = 0

        for j in range(len(elvesInv)):
            if elvesInv[j] > highCal:
                highCal = elvesInv[j]
        
        elvesInv.remove(highCal)
        final_result.append(highCal)
        
    print(sum(final_result))

