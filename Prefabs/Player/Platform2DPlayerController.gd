extends KinematicBody2D

var cMove = preload("res://Scripts/Classes/MovePlatformer.gd")
var cInput = preload("res://Scripts/Classes/KeyInputs.gd")
var cAnimState = preload("res://Scripts/Classes/AnimationState.gd")
var cShooting = preload("res://Scripts/Classes/Shooting.gd")

# exports to inspector
export var playerMaxSpeed = 200
export var acceleration = 0.2
export var jumpForce = 200
export var jumpTreshold = 0.2
 
var key_left = null
var key_right= null
var key_jump= null
var key_fire = null

var player = null
var move = null
var anim = null
var fire = null

# firing
const weapon_bullet = preload("res://Prefabs/Bullet/Bullet.tscn")



func _ready():
	
	#create input control
	key_left = cInput.new("key_left")
	key_right = cInput.new("key_right")
	key_jump = cInput.new("key_jump")
	key_fire = cInput.new("key_fire")
	
	# get player object
	player = get_node(".")
	
	# create platformer2D move controller	
	move = cMove.new(player, key_left, key_right, key_jump, playerMaxSpeed, acceleration, jumpForce, jumpTreshold)
	
	# create AnimationState class
	anim = cAnimState.new(get_node("PlayerAnimation/AnimationPlayer"))

	# create shooting instance
	var container = get_parent().get_node("Container")
	var fire_pivot = get_node("FireOrigin_RIGHT")	
	fire = cShooting.new(move, key_fire,weapon_bullet,container,fire_pivot)
	
	# enable update per frame
	set_fixed_process(true)

	
func _fixed_process(delta):
	
	# realize platformer movement
	move.Apply(delta);
	
	# get animation state and store result to global variable for easy access from any code
	var playerAnimState = anim.GetState(move)
	
	# play animation
	anim.Play(playerAnimState)
	
	# check shooting
	fire.Check()
	
	
	
	