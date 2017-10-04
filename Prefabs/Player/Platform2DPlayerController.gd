extends KinematicBody2D

var global = preload("res://Global.gd")
var cMoveHorizontaly = preload("res://Scripts/Classes/MoveHorizontaly.gd")
var cJumping = preload("res://Scripts/Classes/Jumping.gd")
var cInput = preload("res://Scripts/Classes/KeyInputs.gd")

# exports to inspector
export var playerMaxSpeed = 200
export var acceleration = 0.2
export var jumpForce = 400
export var jumpTreshold = 0.2
export var worldGravity = Vector2(0,1000)
 
var key_left = null
var key_right= null
var key_jump= null

var move = null;
var jump = null;

func _ready():
	
	#create input control
	key_left = cInput.new("key_left")
	key_right = cInput.new("key_right")
	key_jump = cInput.new("key_jump")
	
	# get player object
	var player = get_node(".")
	
	# create horizontal control manager
	move = cMoveHorizontaly.new(player, key_left,key_right,playerMaxSpeed,acceleration)
	
	# create vertical control manager - Gravity + JUMP
	jump = cJumping.new(player,key_jump,jumpForce,jumpTreshold)
	jump.SetGravity(worldGravity)
	
	# enable update per frame
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	# realize horizontal movement
	move.Apply(delta)
	
	# realize vertical movement - Jump + Gravity
	jump.Apply(delta)
