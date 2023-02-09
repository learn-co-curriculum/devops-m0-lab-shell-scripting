#!/bin/bash
# START DO NOT EDIT
# This line generates a number between 1 and 50 and stores it into $random_number
random_number=$((1 + $RANDOM % 50))
# END DO NOT EDIT

# Initialize number of tries to 0
TRIES=0

# Start loop for 5 chances to guess the number
for i in {1..5}
do
  # Read user input for guess
  read -p "Enter your guess: " GUESS

  # Check if guess is correct
  if [ $GUESS -eq $random_number ]
  then
    echo "You won! It took you $TRIES tries."
    break
  fi

  # Increment number of tries
  TRIES=$((TRIES + 1))

  # Provide hint if guess is too high or too low
  if [ $GUESS -gt $random_number ]
  then
    echo "Too high. You have $(expr 5 - $TRIES) tries left."
  else
    echo "Too low. You have $(expr 5 - $TRIES) tries left."
  fi
done

# If user ran out of chances, display message
if [ $TRIES -eq 5 ]
then
  echo "You lost. The number was $random_number."
fi

