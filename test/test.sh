#!/bin/bash
chmod +x ../script.sh

# Modify script so it tests a value we know
sed -i '4s/.*/random_number=25/' ../script.sh
lg -r p -m "Setting random number to 25..."

# Store script output
output=$(../script.sh << EOF
40
30
20
10
25
EOF
)

line_number=0
while IFS= read -r line
do
  case $line_number in 
    0)
      if [[ "$line" == *"high"* || "$line" == *"lower"* ]]; then
        lg -r p -m "First attempt, too high"
      else
        lg -r f -m "First attempt, not too high" -e "Random number was 25. Tested with 40. Make sure your game outputs a message that the attempt was *too high*, or that the user should try a *lower* number."
      fi
      if [[ "$line" == *"5"* || "$line" == *"4"* ]]; then
        lg -r p -m "First attempt, correct attempts remaining given to user"
      else
        lg -r f -m "First attempt, incorrect attempts remaining given to user" -e "Make sure your game also outputs the remaining attempts (at this stage, 5 or 4)"
      fi
      ;;
    1)
      if [[ "$line" == *"high"* || "$line" == *"lower"* ]]; then
        lg -r p -m "Second attempt, too high"
      else
        lg -r f -m "Second attempt, not too high" -e "Random number was 25. Tested with 30. Make sure your game outputs a message that the attempt was *too high*, or that the user should try a *lower* number."
      fi
      if [[ "$line" == *"3"* || "$line" == *"4"* ]]; then
        lg -r p -m "Second attempt, correct attempts remaining given to user"
      else
        lg -r f -m "Second attempt, incorrect attempts remaining given to user" -e "Make sure your game also outputs the remaining attempts (at this stage, 4 or 3)"
      fi
      ;;
    2)
      if [[ "$line" == *"low"* || "$line" == *"higher"* ]]; then
        lg -r p -m "Third attempt, too low"
      else
        lg -r f -m "Third attempt, not too low" -e "Random number was 25. Tested with 20. Make sure your game outputs a message that the attempt was *too low*, or that the user should try a *higher* number."
      fi
      if [[ "$line" == *"2"* || "$line" == *"1"* ]]; then
        lg -r p -m "Third attempt, correct attempts remaining given to user"
      else
        lg -r f -m "Third attempt, incorrect attempts remaining given to user" -e "Make sure your game also outputs the remaining attempts (at this stage, 2 or 1)"
      fi
      ;;
    3)
      if [[ "$line" == *"low"* || "$line" == *"higher"* ]]; then
        lg -r p -m "Fourth attempt, too low"
      else
        lg -r f -m "Fourth attempt, not too low" -e "Random number was 25. Tested with 10. Make sure your game outputs a message that the attempt was *too low*, or that the user should try a *higher* number."
      fi
      if [[ "$line" == *"1"* || "$line" == *"0"* ]]; then
        lg -r p -m "Fourth attempt, correct attempts remaining given to user"
      else
        lg -r f -m "Fourth attempt, incorrect attempts remaining given to user" -e "Make sure your game also outputs the remaining attempts (at this stage, 1 or 0)"
      fi
      ;;
    4)
      if [[ "$line" == *"success"* || "$line" == *"correct"* || "$line" == *"won"* ]]; then
        lg -r p -m "Fifth attempt, correct"
      else
        lg -r f -m "Fifth attempt, not correct" -e "Random number was 25. Tested with 25. Make sure your game outputs a success/winning message."
      fi
      ;;
  esac
  line_number=$((line_number + 1))
done <<< "$output"

echo "$output"