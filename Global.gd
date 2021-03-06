extends Node

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

# ---------------------------------------------------------------------------
# GAME prefabs 
# ---------------------------------------------------------------------------

# teleport button info
var teleport_button_info = preload("res://Prefabs/Entities/TeleportButtonInfo/TeleportButtonInfo.tscn")

# powerups
var powerup_jump = preload("res://Prefabs/PowerUps/PowerUpJump.tscn")
var powerup_speed = preload("res://Prefabs/PowerUps/PowerUpSpeed.tscn")
var powerup_gravity = preload("res://Prefabs/PowerUps/PowerUpGravity.tscn")

# bullet prefab for firing
onready var bullet_prefab = preload("res://Prefabs/Bullet/Bullet.tscn")