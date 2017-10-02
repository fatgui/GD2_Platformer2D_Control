extends Node


# KEYs state
enum eInputKey { KEY_NONE, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_PAUSE, KEY_FIRE, KEY_THROW, KEY_MELEE, KEY_JUMP, KEY_USE}

# Movement state
enum eMoveDirection { MOVE_LEFT, MOVE_RIGHT, JUMP, FALL }

# Action state
enum eActionState { FIRE, THROW, STAB, USE }

# Animation state
enum eAnimState { IDLE, WALK, JUMP, FALL, DIE, HURT, CLIMB, OBSTACLE }


const KEY_NONE = 0

func _ready():

	pass
