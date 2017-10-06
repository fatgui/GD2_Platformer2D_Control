extends KinematicBody2D

var global = preload("res://Global.gd")
var cMove = preload("res://Scripts/Classes/MovePlatformer.gd")
#var cMove = preload("res://Scripts/Classes/MoveHorizontaly.gd")
var cJumping = preload("res://Scripts/Classes/Jumping.gd")
var cInput = preload("res://Scripts/Classes/KeyInputs.gd")

# exports to inspector
export var playerMaxSpeed = 200
export var acceleration = 0.2
export var jumpForce = 200
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
	
	# create platformer2D move controller
	# ver #1 - complex
	move = cMove.new(player, key_left, key_right, key_jump, playerMaxSpeed, acceleration, jumpForce, jumpTreshold)
	
	# ver #2 - separated control
#	move = cMove.new(player, key_left, key_right, playerMaxSpeed, acceleration)
#	jump = cJumping.new(player, key_jump, jumpForce, jumpTreshold)
#	jump.SetGravity(worldGravity)
	
	# enable update per frame
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	# realize platformer movement
	move.Apply(delta)
	#jump.Apply(delta,move.velocity)
	