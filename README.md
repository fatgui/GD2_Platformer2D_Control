# GD2_Platformer2D_Control

Platformer2D game prototype/template

[!Screenshot](../master/screenshots/AGFX_Platform2D_screen1.PNG)

# Features:

- class for move horizontraly
- class for move verticaly
- class for input event
- class for shooting
- class for Platformer2D movement
    - move left
    - move right
    - move jump
    - move fall
    - pickup
- class for animation state checker by assigned Platformer2D movement instance
- collision check is included inside classes
- play animation
- move viewport by player position with smooth transition ON/OFF
- player facing by movement direction
- improved Tileset addon (organize tileset in scene now as in texture and set resource path to image)
- save/load inventory data to file
- teleport from/to (is defined as NODE) via target name of second teleport node with option for requested key
- pickup coins (is defined as NODE)
- pickup ammo (is defined as NODE)
- pickup key (is defined as NODE)
- pickup healt (is defined as NODE)
- pickup time limited powerUp jump modifier 
- pickup time limited powerUp gravity modifier 
- pickup time limited powerUp speed modifier 
- example for simple top-down movement
- example for Platformer2D movement:
    - [left arrow] = move left
    - [right arrow] = move right
    - [up arrow] = enter to door
    - [space] = jump
    - [W] = fire
    - working features:
        - pickup coins + hud info
        - pickup health + hud info (max limit 100)
        - pickup ammo + hud info ()
        - pickup powerup strong jump 10 sec.
        - pickup powerup bigger speed
        - pickup powerup gravity vector (0,500)
        - teleport to second linked teleport by name
        - pickup key
        - teleport with requested key
        - show info when player enter to teleport area

    
# ToDo:

- die
- pull/push
- enemies
- add check if any powerup is executed
- add option for use only one powerup in time
- ...
