# Shell Scripting Lab -- Programming a Guessing Game

## Task

For this lab, we will be creating a simple guessing game in a bash script.

The end result will be a game in which the user has to guess a randomly generated number between 1 and 50, with a maximum of 5 attempts.

After each incorrect attempt, the script will provide a hint to the user if the number they guessed was either too high or too low.

## Setup

As explained in the sample lab guide, we will begin this lab by making a fork of the repo and cloning it. You can do this via the fork button at the top-right of the assignment, and then cloning the fork in your virtual machine.

In the newly cloned folder, you will find a `script.sh` file. This is the script that is going to contain our game.

If you open it in `vim` or `nano`, you'll see that there is already some placeholder code there. 

In a lot of the labs, you will have some prexisting boilerplate code there to get you started. Do not modify any of this existing code, as it can throw the automated tests off base. Insert your own code after the placeholder.

## Pseudocode

When creating a program or script, it's commonplace to first write your code in what is known as *pseudocode*. 

**Pseudocode** just means laying out the general structure of your code in an easy-to-understand way, and then implementing that layout in code. There is no standard for this. In our case, we're simply going to approach it by creating comments in the script detailing what it should do, and then implementing what the comments are describing.

Some labs might provide pseudocode to help get you started; it's recommended you copy them over as comments to your code, and then implement them line-by-line. Even in the case when there is no pseudocode provided, it's still a good idea to write your own to help collect your thoughts and structure your code before you spend a lot of time on it.

Here's an example that you can use for this lab (copy this into `script.sh`, after the boilerplate code):

```bash
# Initialize number of tries to zero
# Loop 5 times to give the user chances to guess the number
  # Read user input as guess
  # Check if guess is correct
  # If not correct, increment number of tries
  # Provide hint if guess is too high or too low
# If tries are greater than or equal to five, the user ran out of chances, in which case echo losing message
```

See how handy it is to have a basic outline of your implementation ready before you even write the first line of code? It's very common, especially when starting out, to have no idea where to begin with your script. Fleshing out some pseudocode or comments beforehand can be a great way to get over that initial hurdle, and saves you time down the line:

```bash
# Initialize number of tries to zero
tries=0

# Loop 5 times to give the user chances to guess the number
for i in {1..5}
...
```

Sample output should look something like:
```bash
Enter your guess: 25
Too high. You have 4 tries left.
Enter your guess: 10
Too low. You have 3 tries left.
Enter your guess: 20
You won! It took you 2 tries.
```
