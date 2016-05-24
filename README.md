# A game of 24 played on the console in Ruby
The code follows a functional core, imperative shell style OO style of organization, where the functional core has the bulk of the logic of the game and the imperative shell simply calls the functional core.

### How to play
Given four numbers, use ( +, -, *, / ) to arrive at the number 24.    
Eg: [ 1, 2 ,3 ,4 ]  
(4 * 3 = 12) | (12 * 2 = 24) | (24 / 1 = 24)  
You may use ( +, -, *, / ) as many times as you want. But each number only once. 

##### Getting the game
Clone the repo with `git clone https://github.com/kamok/twenty-four.git`  
Start the game with `ruby 24.rb` 

##### Playing the game
When you start, you will be prompted to type in a number of easy and hard card you want to play. I recommend 3 easy and 1 hard to start, as the hard cards are really really hard.  
Then, given a card, enter a operation with only two numbers. eg. 1+1. Spaces don't matter. That's it! Good luck.

##### Future Versions
I plan to implement multiplayer in the future. In 24.rb right now, there's a method that sets an instance variable called @player_list into an array containing the players's ID. At the beginning of each cycle of attempting to solve a card, a player will need to set their player ID first to identify who is solving the question. 

Then, a points system will need to be added to induce competitiveness. Since each card has a different diffculty level, each card will be worth different points. That would need a restructure of the data strcture in storing the cards right now, probably using a hash with each key being the card and a value of the points after it. 