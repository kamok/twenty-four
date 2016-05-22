todo:
Seperate out into a Card class.
Make 24.rb a class? Waiting on Dylan

24 Solver         

Given: 
1 + 2 + 3 + 4        [1, "+", 2, "+", 3, "+", 4]

Here are the possible order of operations combinations:

(1 + 2) + 3 + 4      "(" @ [0]  ")" @ [4]
(1 + 2 + 3) + 4      "(" @ [0]  ")" @ [6]
1 + (2 + 3 + 4)      "(" @ [2]	")" @ [8]
1 + 2 + (3 + 4)			 "(" @ [4]  ")" @ [8]
(1 + 2) + (3 + 4)    "(" @ [0]  ")" @ [4]  "(" @ [6]  ")" @ [10] 

Old:
((1 + 2) / 3) * 4    "((" @ [0], ")" @ [4] and [7]       
(1 + (2 / 3)) * 4    "(" @ [0 and [3], "))" @ [7]        
1 + ((2 / 3) * 4)            
1 + (2 / (3 * 4))            
(1 + 2) / (3 * 4)  


Object of the game: Make the number 24 from the four numbers on a game card.
You can add, subtract, multiply and divide. Use all four numbers on the card, but use each number only once. You do not have to use all four operations. 
EG: [1, 2, 3, 4] 

4*3=12
12*2=24
24/1=24

This card has a value of 1. Ranges from 1-3, with 3 being hardest.

2 Versions.
Version 1: multiplayer. Version 2: single player and timed.

Version 1: At game start, initiate number of players, and names for players.
eg. Player A = "Bob", Player B = "Cait"
A card is shown, and players have to solve in head.
When they get it, they type in A or B to let game knows it's them typing
Then they type in the solution eg. "4*3=12" *numbers disappear remaining:[1, 2 ]
"12*2=24" remaining:[1]
"24/1=24" player A wins, gets the point
Another card is shown...etc. If player gets wrong, they are deducted 1/2 point of card value.
Game continues for 10 cards. Highest number of points win. 

Version 2: singleplayer. Use Time.current at start of Card 1. Then, anytime a player solves a card, we take another Time.current. Subtract old time by new time and if it exceeds a certain amount no more cards. 
