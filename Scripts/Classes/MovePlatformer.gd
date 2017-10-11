# walking
var object
var key_1
var key_2
var key_3
var speed = 0
var accel = 0
var movement = 0
var velocity = Vector2()

# Jumping
var world_gravity = Vector2(0,1000)
var jumpForce = 400
var jumpTreshold = 0.2
var _jump_timer = 0;
var _is_enabled = true;
var isOnGround = false;
var jumping = false;

# Movement Constants
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 20
const MIN_SPEED = 0.2

# COnstructor
func _init(obj,mKeyLeft,mKeyRight,mKeyJump,object_speed, object_acceleration,obj_jump_force,obj_jump_treshold):
	object = obj
	key_1 = mKeyLeft
	key_2 = mKeyRight
	key_3 = mKeyJump
	speed = object_speed
	accel = object_acceleration
	jumpForce = obj_jump_force
	jumpTreshold = obj_jump_treshold
	
# Apply movement to object
func Apply(delta):
	
	velocity += world_gravity * delta
	_jump_timer += delta 
	movement = 0;
	
	if key_1.Check(): movement = -1
	if key_2.Check(): movement = 1
	
	movement*=speed
	
	velocity.x = lerp(velocity.x, movement, accel)
	
	velocity = object.move_and_slide(velocity,FLOOR_NORMAL,SLOPE_FRICTION) 
	isOnGround = object.is_move_and_slide_on_floor()
	
	if(isOnGround): _jump_timer = 0 
		
		# is jump enabled by treshold time ?
	_is_enabled = _jump_timer < jumpTreshold 
	
	# Apply jump force on key pressed when is enabled
	if( key_3.Check() and _is_enabled):
		jumping = true;
		velocity.y -= jumpForce
		_jump_timer = jumpTreshold 
		
	if velocity.y > 0: jumping = false;
	
# Get last velocity vector
func GetVelocity():
	return velocity