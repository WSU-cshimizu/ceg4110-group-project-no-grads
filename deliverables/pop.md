# Project Overview Proposal

## Matthew's Journey

#### Elevator Pitch

Matthew's Journey will be a 2D pixel art Zelda-like adventure game featuring a two phased combat system with deck building mechanics. Combat will be split between a preperation phase and a fight phase.  In the preperation phase players will draw and select cards that determine the items, abilites, and bonuses Matthew is able to use in the Fight phase real time combat round. Combat will cycle between the prep and fight phases until the enemies are defeated. New cards to expand Matthew's abilities may be awarded from combat our found through exploration of the game world. None of the team has made a game of this scope before. The goal is that by the end of the semester we will have created an engaging and complex game that demonstrates our abilities and that we hope you will have fun playing. 

#### Components of Complexity

1. Graphical User Interface  
The gui will include the title screen, menus, and dialog boxes. It also includes any other on-screen game state representations needed such as health bars or item tooltips.

2. Map  
The map component includes the tileset for all pixel art assests in the game. It will create the gamemap the character explores including implementing walls and boundries and handling screen transitions. It will also define character interation within the map such as doors, etc.

3. Items  
This component will create the inventory system and the logic of all equipment and items in the game including the cards and other potential pickups such as potions, relics, etc. 

4. Combat  
Implements the combat system to include hit detection, player movement, enemy behavior, equiping of chosen cards before fight phase, etc.  
  
#### Predicted Architecure

* How do the components fit together (i.e., predicted architecture)?
    * Prompt: "We think, based on not touching it yet, we'll do..."
    * A Legend of Zelda like game, 2D pixel art with combat throughout the journey and a boss at the end.  

#### Framework

We will be using the <a href="https://libgdx.com/">libGDX</a> framework to develop this project. We decided we would write our game in Java because that is the one language everyone in the group is familiar with. Through some research libGDX stood out as a very mature and stable Java game development framework. It includes a lot of modules that support 2D game development as well as plenty of 3rd party libraries to extend it even further. Some of the libraries include 2D physics, lighting, and pathfinding which will be very useful in our project. 

#### Development Life-Cycle

* What is the predicted life cycle/methodology that you will follow?: We will be following the Agile life cycle. 

## Rubric
| Points | Metric                                            |
| ------ | ------------------------------------------------- |
| 1      | Does it look nice?                                |
| 1      | Does it contain the information that's solicited? |
| 1      | &#9; Predicted methodology present?               |
|        | Is your justification convincing?                 |
| 3      | &#9; Are the components well-described?           |
| 2      | &#9; Is the architecture well-described?          |
| 1      | How will it be implemented?                       |
| 1      | Justify your choice.                              |
| **10** | **Total**                                         |
