extends KinematicBody2D

var global = preload("res://Global.gd")
var moveHorizontaly = preload("res://Scripts/Classes/MoveHorizontaly.gd")

var input = preload("res://Scripts/Classes/KeyInputs.gd")

# exports to inspector
export var playerMaxSpeed = 200
export var acceleration = 0.2

var key_left = null
var key_right= null
var key_jump= null

var movement_H = null;

func _ready():
	
	#create input control
	key_left = input.new("key_left")
	key_right = input.new("key_right")
	key_jump = input.new("key_jump")
	
	# get player object
	var player = get_node(".")
	
	# create horizontal control manager
	movement_H = moveHorizontaly.new(player, key_left,key_right,playerMaxSpeed,acceleration)
	
	# create vertical control manager - Gravity + JUMP
	
	
	# enable update per frame
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	# realize horizontal movement
	movement_H.DoMove(delta)	
	
	# realize vertical movement - Jump + Gravity
	
