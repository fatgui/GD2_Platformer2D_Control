extends Node

var shooting = true
var timer = null
var bullet_delay = 0.25
var bullet_prefab = null
var bullet_holder = null
var shooter = null
var key = null
var origin = null

# -----------------------------------------------------------
# Shooting class constructor
# -----------------------------------------------------------
func _init(_shooter,_key, _bullet,_holder,_origin):
	shooter = _shooter
	key = _key
	bullet_prefab = _bullet
	bullet_holder = _holder
	origin = _origin
	
	# create timer
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout",self,"on_timer_complete")
	bullet_holder.add_child(timer)
	
# -----------------------------------------------------------
# Check if fire key was pressed
# -----------------------------------------------------------
func Check():

	# if is disabled => exitt
	if !shooting: return

	# fire
	if key.Pressed(): Shoot()


# -----------------------------------------------------------
# Private: Enable fire after timer complete wait
# -----------------------------------------------------------
func on_timer_complete():
	shooting = true

# -----------------------------------------------------------
# Private: Create bullet
# -----------------------------------------------------------
func Shoot():	

	var bullet = bullet_prefab.instance()	
	shooting = false
	var pos = origin.get_global_pos()
	
	bullet_holder.add_child(bullet)	
	bullet.set_pos(pos)	
	if shooter.facing == Global.eFacing.TO_LEFT: bullet.SetFireDirection(-1)
	if shooter.facing == Global.eFacing.TO_RIGHT: bullet.SetFireDirection(1)
	
	timer.start()	
