# Requirements Specification

## Requirements
These are provided as _minima_ for the document. It is likely that in order to be comprehensive, you will want more requirements.
* Two _top-level_ requirements per user story.
* One _top-level_ requirement per graduate student that pertains to testing.
* Our stories: 
### R1 : The Player shall be able to engage in combat
* As a player, I want to be able move my character and swing my sword to fight enemies.
   - The character shall move.
   - The game map shall contain enemies.
   - The enemies shall be killable. 
* As a player, I want to navigate an enviornment that's easy to explore with collision that supports my movement and keeps me within bounds.
   - The play area shall have collision.
   - The play area shall have boundaries.
* As a player, I want to interact with characters through dialogue boxes and understand how to play the game through those interactions.
   - The characters shall have a dialogue mechanic.
   - The characters shall have something meaningful to instruct the player on.
* As a player, I want to have a UI that shows a hud so that I can keep track of important details such as my health.
   - The UI shall have a health system.
   - The health system shall accuratley show current health and update accordingly.  
* As a player developer, I want elements in the environment for the player to interact with.
   - There shall be an interaction system with certain elements in the enviornment.
   - The interactions shall deliver meaningful information to the player.
* As a level designer, I want a variety of enemies to make gameplay engaging and difficult.
   - There shall be more than one enemy.
   - The shall be enemies that are different enough to require different tactics.
* As a story and sound designer, I want an engaging world to house unique characters in.
   - There shall be a diverse group of characters.
   - The play area shall not be too small to be crammed but not too big to feel empty.
* As a UI designer, I want to have different aspects and functions of the game that my UI can keep track of for the user.
   - The game shall have a UI element for one function (Health).
   - The game shall have a UI element for another function (Controls).

Recall that a _top-level_ requirement should have _mid/low-level_ requirements beneath it that narrow the scope.
   Virginia's note: Damn, that's a whole lot of things. I wrote stuff that I thought the stories were describing, if you think we could loophole something, specify in parenthesis what we should do.
   * Things that are done on 10/15:
      * Character must move
      * There must be enemies
      * Play area must have collision
      * Play area must have boundaries
      * There is a health system
      * Characters have a dialogue mechanic
      * There is more than one enemy
      * Have a UI element for one function (Health)
   * Things that are not done on 10/15:
      * Enemies are killable
      * Characters have something meaningful to instruct the player on
      * The health system accuratley shows current health and updates accordingly
      * There is an interaction system with certain elements in the enviornment
      * The enemies are different enough to require different tactics
      * There are a diverse group of characters
      * Have a UI element for another function (Controls)
      * The play area must not be too small to be crammed but not too big to feel empty 
      * The interactions can deliver meaningful information to the player 
   
   

## Submission Details
* This assignment should be placed in the team repository in the `deliverables` directory.

## Rubric
| Points | Metric                                            |
| ------ | ------------------------------------------------- |
| 2      | Does it look nice?                                |
| 2      | Follows the appropriate language.                 |
| 3      | Minimum number of requirements present.           |
| 3      | Appropriate mid/low level requirements coverage.  |
| **10** | **Total**                                         |
