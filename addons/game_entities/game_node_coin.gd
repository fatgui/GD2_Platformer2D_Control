tool

extends Area2D

#load("res://Scripts/Classes/Inventory.gd")


var path = 'res://Sprites/Entities/'

var sprite = Sprite.new()
var shape = CollisionShape2D.new()

export(int,0,3) var key_type = 0 setget _set_key_type

func _get_item_rect():
    return sprite.get_item_rect() # Notice this call does not start with


func _set_key_type( value ):
	var type = clamp(value, 0, 3)
	var tex = load(path+'Coin_'+str(type)+'.png')
	key_type = type
	if sprite:
		sprite.set_texture(tex)
		sprite.set_name("ItemSprite")
		
	else:
		print("NO")

func _enter_tree():
	add_child(shape)
	add_child(sprite)
	
	var sh = CircleShape2D.new()
	sh.set_radius(6)	
	shape.set_shape(sh)	
	set('key_type', key_type)
	
	
func pickup():
	#Inventory.items.coins += 1
	queue_free()

