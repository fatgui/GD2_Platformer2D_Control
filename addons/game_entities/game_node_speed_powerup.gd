#------------------------------------------------
# ITEM: DOUBLE JUMP
# EVENT: Pickup (onEnterArea)
#------------------------------------------------
tool

extends Area2D

var path = 'res://Sprites/Entities/'

var sprite = Sprite.new()
var shape = CollisionShape2D.new()

export(int,0,3) var key_type = 0 setget _set_key_type

var item_type = "speed_powerup"

# recreate selection gizmo to sprite size
func _get_item_rect():
    return sprite.get_item_rect() # Notice this call does not start with

# set property
func _set_key_type( value ):
	var type = clamp(value, 0, 3)
	var tex = load(path+'Speed_'+str(type)+'.png')
	key_type = type
	if sprite:
		sprite.set_texture(tex)
		sprite.set_name("Item_"+item_type+"_"+str(type))

# create node objects on enter to scene tree
func _enter_tree():
	add_child(shape)
	add_child(sprite)
	
	var sh = CircleShape2D.new()
	sh.set_radius(6)	
	shape.set_shape(sh)	
	set('key_type', key_type)
	
# pickup item method which is called from area detector assigned on player
func PowerUpSpeed():	
	queue_free()