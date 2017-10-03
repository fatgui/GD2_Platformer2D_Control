var object
var key_1
var key_2
var speed = 0
var accel = 0
var movement = 0
var velocity = Vector2()


# Movement Constants
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 20

func _init(obj,mKeyLeft,mKeyRight,object_speed, object_acceleration):
	object = obj
	key_1 = mKeyLeft
	key_2 = mKeyRight
	speed = object_speed
	accel = object_acceleration
	
# Movement control
func DoMove(delta):
	
	movement = 0;
	
	if key_1.Check(): movement = -1
	if key_2.Check(): movement = 1
	
	movement*=speed
	velocity.x = lerp(velocity.x, movement, accel)
	
	object.move_and_slide(velocity,Vector2(0, -1),20) 
	
	