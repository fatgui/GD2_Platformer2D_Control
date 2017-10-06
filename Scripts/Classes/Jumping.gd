
var key
var object
var world_gravity = Vector2(0,1000)
var jumpForce = 400
var jumpTreshold = 0.2
var velocity = Vector2()

var _jump_timer = 0;
var _is_enabled = true;
var _is_ground = false;

func _init(obj, mKey, obj_jump_force, obj_jump_treshold):
	object = obj
	key = mKey
	jumpForce = obj_jump_force
	jumpTreshold = obj_jump_treshold
	
func SetGravity(new_gravity):
	world_gravity = new_gravity
	
	
func Apply(delta):
	
#	# add gravity
#	velocity +=  world_gravity * delta
#	
#	
#	#_jump_timer += delta 
#	
#	object.move_and_slide(velocity,Vector2(0, -1),20)
#	_is_ground = object.is_move_and_slide_on_floor()
#	
#	# Is on ground ?
#	if _is_ground: 
#		_jump_timer = 0
#		velocity.y = 0
#	
#	# is jump enabled by treshold time ?
#	_is_enabled = _jump_timer < jumpTreshold 
#	
#	# Apply jump force on key pressed when is enabled
#	if( key.Check() and _is_enabled):
#		velocity.y -= jumpForce
#		_jump_timer = jumpTreshold 

	velocity +=  world_gravity * delta

	object.move_and_slide(velocity,Vector2(0, -1),20)
	_is_ground = object.is_move_and_slide_on_floor()
	
	
	# Is on ground ?
	if _is_ground:
		_is_enabled = true
		_jump_timer = 0
		velocity.y = 0
		
		if key.Check() and _is_enabled: 
			velocity.y -= jumpForce
			_jump_timer = jumpTreshold 
			_is_enabled = false
			
	
		
		
		
	
	
	
	