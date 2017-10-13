extends Node


# KEYs state
#enum eInputKey { KEY_NONE, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_PAUSE, KEY_FIRE, KEY_THROW, KEY_MELEE, KEY_JUMP, KEY_USE}

# Movement facing state
enum eFacing { TO_LEFT, TO_RIGHT}

# Action state
#enum eActionState { FIRE, THROW, STAB, USE }

# Animation state
enum eAnimState { IDLE, WALK, JUMP, FALL, DIE, HURT, CLIMB, OBSTACLE }


# global game variables
var coins = 0;
var health = 0;
var items = {};