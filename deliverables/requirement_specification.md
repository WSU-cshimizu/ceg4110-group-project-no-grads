# Requirements Specification

## User Stories:
* As a player, I want to be able move my character and swing my sword to fight enemies.
   - The character shall move.
        - They shall use the arrow keys to move up, down, left, and right.
        - They shall use the WASD keys to move up, down, left, and right. 
   - The enemies shall be killable.
        - The player shall use the spacebar to attack enemies with the sword attack
        - The player shall have a hurtbox on the body to register collisions to negate health from the player.
        - The player shall have a hitbox on the sword to register collisions to negate health from enemies.
        - All enemies shall have a hurtbox on the body to register collisions to negate health from themselves.
* As a player, I want to navigate an enviornment that's easy to explore with collision that supports my movement and keeps me within bounds.
   - The play area shall have collision.
        - The mountainsides and level items shall have collision.
        - The NPCs shall have collision.
   - The play area shall have boundaries.
        - The play area shall be defined and clear boundaries that are integrated into the environment. 
* As a player, I want to interact with characters through dialogue boxes and understand how to play the game through those interactions.
   - The characters shall have a dialogue mechanic.
        - The player shall enter dialogue immediatley when entering the proximity of an NPC
   - The characters shall have something meaningful to instruct the player on.
        - The NPCs shall give control tips through their thier dialogue.
* As a player, I want to have a UI that shows a hud so that I can keep track of important details such as my health.
   - The UI shall have a health system.
        - The UI health system shall begin at 5 hearts.
   - The health system shall accuratley show current health and update accordingly.
        - The UI health system shall be decremented upon entering a hitbox.
        - The UI shall reansition to the game over screen when all hearts are depleted at zero.
        - The UI game over screen shall send the player back to the main menu upon pressing the spacebar. 
* As a player developer, I want elements in the environment for the player to interact with.
   - There shall be an interaction system with certain elements in the enviornment.
        - The game world shall contain damage zones (such as a campfire) that will have it's own hurtbox. 
   - The interactions shall deliver meaningful information to the player.
        - There shall be paths in the grass in the gameworld that can serve as a guide for the player.
        - There shall be mountains to limit navigation for the player.
        - There shall be NPCs to deliver instructions to the player. 
* As a level designer, I want a variety of enemies to make gameplay engaging and difficult.
   - The game map shall contain enemies.
        - The game map shall contain slime enemies.
        - The game map shall contain skeleton enemies.
   - There shall be enemies that are different enough to require different tactics.
        - The slime enemy shall be slower than the skeleton
* As a story and sound designer, I want an engaging world to house unique characters in.
   - There shall be a diverse group of characters.
        - There shall be NPCs placed in meaningful locations with a varietey of information to give the player.
        - The NPCs shall look different from one another. 
   - The play area shall not be too small to be crammed but not too big to feel empty.
        - The play area will be appropriatley sized, containing narrow paths and wide open rooms to allow for interesting situations in gameplay. 
* As a UI designer, I want to have different aspects and functions of the game that my UI can keep track of for the user.
   - The game shall have a UI element for one function (Health).
        - There shall be a UI Health system that displays the current player health in the top left of the screen. 
   - The game shall have a UI element for another function (Controls).
        - There shall be a UI Controls element which is an option on the main menu that displays the controls for the player.
        - The UI Controls element shall allow the player to return to the main menu by pressing the spacebar. 
   
