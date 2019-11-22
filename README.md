# Project: Mastermind

In a [previous project](https://github.com/BShowen/ruby_mastermind_game) I created the back-end (or terminal based) game of Mastermind. In this project I took that back-end and used Sinatra to create a simple front-end for the game. Its my very first Sinatra application, so it's not perfect or the pretiest. 

## How to play
Easy, [click here!](https://bradley-mastermind.herokuapp.com/)

### Known bugs
* When you set your code and let the AI guess your code sometimes the AI will get stuck. What is happening is the AI has guessed the correct numbers but in the wrong sequence. Instead of shuffling the numbers to form a new guess the AI will create an entire new guess. This only happens under certain conditions and is very hard to replicate. I have not taken the time to go through and replicate the scenario to find out EXACTLY what is happening. One day....
