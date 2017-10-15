tool

extends Area2D

var path = 'res://Sprites/Entities/'

var sprite = Sprite.new()
var shape = CollisionShape2D.new()

export(int,0,3) var teleport_type = 0 setget _set_teleport_type

export var target_name = "Teleport_B"

# recreate selection gizmo to sprite size
func _get_item_rect():
    return sprite.get_item_rect() # Notice this call does not start with

# set property
func _set_teleport_type( value ):
	var type = clamp(value, 0, 3)
	var tex = load(path+'Teleport_'+str(type)+'.png')
	teleport_type = type
	if sprite:
		sprite.set_texture(tex)
		sprite.set_name("Teleport_"+target_name+"_"+str(type))

# create node objects on enter to scene tree
func _enter_tree():
	add_child(shape)
	add_child(sprite)
	
	var sh = RectangleShape2D.new()
	sh.set_extents(Vector2(10,10))
	shape.set_shape(sh)	
	shape.set_z(50)
	set('teleport_type', teleport_type)
	
# pickup item method which is called from area detector assigned on player
func transport(player):
	pass
	