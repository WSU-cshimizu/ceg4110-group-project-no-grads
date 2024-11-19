# Meeting Minutes (10/08/2024)

## Administrative
* Time: 1200
* Location: In-Class
* Scribe: Robert D'Allessandris

## Agenda
* Weekly Tasks

## Notes

**Robert's Weekly Contributions:**
- Did a lot of extra work for fun (enjoying Godot development)
- Overhaul to damage system
    - Attack objects are passed from a hitbox to a hurtbox wherein the owning entity can decide how to deal with the attack 
    - Attack objects define the damage, knockback force and direction of an attack
- Enemy Updates
    - Enemies give xp on kill
    - Enemies drop coins on kill
    - Enemies display a health bar when damaged
    - Enemies are knocked back when hit
- Skeleton update.
    - Skelly's stop chase when player exits detection zone
    - animations updated to include directional walk and idle, and a death animation
    - skelly plays a sound when hit
- Hud updates XP after killing an enemy
- Player level up implemented
    - after a specific amount of xp player automatically levels up
    - victory music is played
    - The words level up! fade in and out on the screen
    - The players maximum health is increased by one and this change is reflected in hearts display
    - Player is knocked back when hit
- Sound Effects added to most in game actions: item pickup, sword swing, enemy hit, etc.
- Different music tracks play in main menu, game and game over screen
- Added speech bubble over cow and guard npc's indicating you can talk to them when in range
    - The speech now waits for the player to hit enter when in range before triggering dialog
- Added sheep and pigs with animations and collision
- Added Fruit trees
- Added fountain
- Added a Witch, complete with house, broom bat and cauldron that have animations
- Added 2d lighting on the campfire and a new lamppost
- Added the ability to use arrow keys and tab to navigate main menu
- Added functionality to top right game screen button. Now quits game back to main menu

**Virginia's Weekly Contributions**
- Fix for Heart GUI bug
- Added Apple item pickups that restore 1 health
- Added Cherry item pickup that restores full health
- Added Coins and keys with corresponding HUD elements displaying total collected
- Coins have different tiers with different values
- Added HUD xp count

**Cara's Weekly Contribution's**
    - Complete rework of the game map
    - Map is to be final version of the level for the game
    - map includes town area, forest, river, and witch's hut location

**Josiah's Weekly Contribution's**
    - As discussed in discord, due to scheduling problems no work has been done

## Action Items
**Robert**
* Add enemies and obstacles to new map
**Virginia**
* Add Level to HUD
* Add collectibles and pickups to new map
**Cara**
* Add collisions to the new map tileset
**Josiah**
* Not present at class meeting to discuss weekly action item's. Has stated no current work being done
 

## Signatures
After the notes and action items have been pushed, each person should take a time to review them. If everything is agreeable, push a single commit with your name as a signature. 
* Robert D'Allessandris
* 
* 
* 
