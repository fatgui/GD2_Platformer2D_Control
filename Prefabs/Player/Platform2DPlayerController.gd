extends KinematicBody2D

var cMove = preload("res://Scripts/Classes/MovePlatformer.gd")
var cInput = preload("res://Scripts/Classes/KeyInputs.gd")
var cAnimState = preload("res://Scripts/Classes/AnimationState.gd")

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
var anim = null;

func _ready():
	
	#create input control
	key_left = cInput.new("key_left")
	key_right = cInput.new("key_right")
	key_jump = cInput.new("key_jump")
	
	# get player object
	var player = get_node(".")
	
	# create platformer2D move controller	
	move = cMove.new(player, key_left, key_right, key_jump, playerMaxSpeed, acceleration, jumpForce, jumpTreshold)
	
	# create AnimationState class
	anim = cAnimState.new(get_node("PlayerAnimation/AnimationPlayer"));
		
	# enable update per frame
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	# realize platformer movement
	move.Apply(delta);
	
	# get animation state and store result to global variable for easy access from any code
	var playerAnimState = anim.GetState(move);
	
	# play animation
	anim.Play(playerAnimState);
	