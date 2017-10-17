extends KinematicBody2D

# preload used classes
var cMove = preload("res://Scripts/Classes/MovePlatformer.gd")
var cInput = preload("res://Scripts/Classes/KeyInputs.gd")
var cAnimState = preload("res://Scripts/Classes/AnimationState.gd")
var cShooting = preload("res://Scripts/Classes/Shooting.gd")

# exports to inspector
export var playerMaxSpeed = 200
export var acceleration = 0.2
export var jumpForce = 200
export var jumpTreshold = 0.2

# clear instances

var key_left = null
var key_right= null
var key_jump= null
var key_fire = null

var player = null
var move = null
var anim = null
var fire = null
var teleport_info = null
# signal for update viewport
signal moveSignal

# resize gizmo to player sprite size ()
func _get_item_rect():
    return get_node("PlayerAnimation/Sprite").get_item_rect()

func _ready():

	# preload Inventory data
	Inventory.Load();

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
	var container =  Utils.find_node("Container")
	var fire_pivot = get_node("FireOrigin_RIGHT")	
	fire = cShooting.new(move, key_fire,Global.bullet_prefab,container,fire_pivot,false)
	
	# create teleport button info instance
	teleport_info = Global.teleport_button_info.instance()
	teleport_info.set_global_pos(Vector2(0,-5000));
	container.add_child(teleport_info)
	
	# enable update per frame
	set_fixed_process(true)

	
	Inventory.Set('coins',0);
	Inventory.Set('health',100);
	Inventory.Set('ammo',100);
	
	
func _fixed_process(delta):
	
	# realize platformer movement
	move.Apply(delta)
	
	# get animation state and store result to global variable for easy access from any code
	var playerAnimState = anim.GetState(move)
	
	# play animation
	anim.Play(playerAnimState)
	
	# check shooting
	fire.Check()
	
	# update viewport position
	if move.inMotion: emit_signal("moveSignal")
	

func _exit_tree():
	Inventory.Save();
	
# ---------------------------------------------------------
# ON ENTER TRIGGER callback for scene entities
# ---------------------------------------------------------
func _on_TriggerDetector_area_enter( area ):
	
	# pickup ITEM
	if area.has_method('pickup'):
		area.pickup()
		
	# teleport to target when player press 'key_up'
	if area.has_method('Teleport'):
		teleport_info.set_global_pos(area.get_global_pos())		
		teleport_info.Show()
		area.Teleport(player)
		
	# Pickup timelimited jump force
	if area.has_method('PickupPowerUpJump'):
		
		# setup powerup
		var jump = Global.powerup_jump.instance()
		var container =  Utils.find_node("Container")
		jump.Start(move,container,area.time_to_off,area.new_jump_force)
		
		# remove powerup
		area.PickupPowerUpJump()

	# Pickup timelimited speed 
	if area.has_method('PickupPowerUpSpeed'):		
		
		# setup powerup
		var speed = Global.powerup_speed.instance()
		var container =  Utils.find_node("Container")
		speed.Start(move,container,area.time_to_off,area.new_speed)
		
		# remove powerup
		area.PickupPowerUpSpeed()
	
	# Pickup timelimited gravity 
	if area.has_method('PickupPowerUpGravity'):
		
		# setup powerup
		var grav = Global.powerup_gravity.instance()
		var container =  Utils.find_node("Container")
		grav.Start(move,container,area.time_to_off,area.new_gravity)
		
		# remove powerup
		area.PickupPowerUpGravity()

# ---------------------------------------------------------
# ON EXIT TRIGGER callback for scene entities
# ---------------------------------------------------------
func _on_TriggerDetector_area_exit( area ):
	
	# reset teleport to target when player exit from area and key wasn't pressed
	if area.has_method('ResetTeleport'):
		teleport_info.Hide()
		area.ResetTeleport()
		
		
