# Project Overview Proposal

## Matthew's Journey

#### Elevator Pitch

Matthew's Journey will be a 2D pixel art, top down, Zelda-like adventure game with will be real-time hack and slash combat. None of the team has made a game of this scope before. The goal is that by the end of the semester we will have created an engaging game that demonstrates our abilities and that we hope you will have fun playing. 

#### Components of Complexity

1. Graphical User Interface  
The gui will include the title screen, menus, and dialog boxes. It also includes any other on-screen game state representations needed such as health bars or item tooltips.

2. Map  
The map component includes the tileset for all pixel art assests in the game. It will create the gamemap the character explores including implementing walls and boundries and handling screen transitions. It will also define character interation within the map such as doors, etc.

3. Items  
This component will create the inventory system and the logic of all equipment and items in the game including the cards and other potential pickups such as potions, relics, etc. 

4. Combat  
Implements the combat system to include hit detection, player movement, and enemy behavior. 
  
#### Predicted Architecture

We want to create a Legend of Zelda like game, 2D pixel art with combat throughout the journey and a boss at the end. We expect that we’ll need to have architecture for pausing, saving, and loading the game, as well as architecture for rendering, collision, the multiple UIs, and audio/visual components. These will be the first things to work on. After that, we’ll create items and cards for the player to utilize and set each one with a function. Then, we’ll create multiple enemies that will wander the game world. There will be an AI element to control their movement and strategies.

#### Framework

We will be using the <a href="https://godotengine.org/">Godot Engine</a> to develop this project. We have decided to use Godot because it is a full featured, free, open source framework. There are also plenty of tutorials for it's many features. 

#### Development Life-Cycle

We will be following the Agile life cycle. Once we understand and set up our shared java workspace, we will begin by making a list of features and sort them by importance. The most important features, such as collision, will be given high priority and developed first while less important features, such as a song for the title screen, will be developed as late as possible to give time for developing the most meaningful features. We may come up with a new idea for a feature and consult the other group members before deciding it’s place on our feature priority list. We will routinely test the game to ensure that our systems work and to check for bugs that make the game unplayable. Minor bugs may be ignored if not too dangerous. We will document our work with notes for the other team members. Prior to our presentation at the end of the semester, we will gather gameplay footage for our presentation.
