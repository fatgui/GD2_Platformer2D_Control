
var key
var object
var world_gravity = Vector2(0,1000)
var jumpForce = 400
var jumpTreshold = 0.2
var velocity = Vector2()

var _jump_timer = 0;
var _is_enabled = true;

func _init(obj, mKey, obj_jump_force, obj_jump_treshold):
	object = obj
	key = mKey
	jumpForce = obj_jump_force
	jumpTreshold = obj_jump_treshold
	
func SetGravity(new_gravity):
	world_gravity = new_gravity
	
	
func Apply(delta):
	
	# add gravity
	velocity +=  world_gravity * delta
	
	_jump_timer += delta 
	
	# Is on ground ?
	if(object.is_move_and_slide_on_floor()): _jump_timer = 0
	
	# is jump anabled by tresjold time ?
	_is_enabled = _jump_timer < jumpTreshold 
	
	# Apply jump force on key pressed when is enabled
	if( key and _is_enabled):
		velocity.y -= jumpForce
		_jump_timer = jumpTreshold 
		
	velocity = object.move_and_slide(velocity)
		