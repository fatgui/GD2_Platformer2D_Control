#------------------------------------------------
# ITEM: TELEPORT/DOOR/ENTRANCE
# EVENT: key_use (inArea) - trigger
#------------------------------------------------
tool

extends Area2D

var path = 'res://Sprites/Entities/'

var sprite = Sprite.new()
var shape = CollisionShape2D.new()
var spawn = Position2D.new();
var waitOnKey = false
var eventOwner = null
var main_node setget , _get_main_node

export(int,0,3) var teleport_type = 0 setget _set_teleport_type

export var target_name = "Teleport_B"
export var key_name = "key_up"

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
		

# create node objects on enter to scene tree
func _enter_tree():
	
	spawn.set_name(self.get_name()+"_Shape");
	add_child(shape)
	
	sprite.set_name(self.get_name()+"_Sprite");
	add_child(sprite)
	
	spawn.set_name(self.get_name()+"_Spawn");
	spawn.set_pos(Vector2(20,0));
	add_child(spawn)
	
	var sh = RectangleShape2D.new()
	sh.set_extents(Vector2(10,10))
	shape.set_shape(sh)	
	shape.set_z(50)
	shape.set_trigger(true);
	set('teleport_type', teleport_type)
	
# teleport to target area when key_use is pressed on player
func Teleport(player):
	print("teleportation ready")
	set_process(true)
	eventOwner = player
	pass

func ResetTeleport():
	set_process(false)
	
func _process(delta):
	if Input.is_action_pressed(key_name):		
		set_process(false)
		var target_node = self.find_node(target_name)
		var target_pos = target_node.get_node(target_name+"_Spawn")		
		var pos = target_pos.get_global_pos()
		
		print("start teleportation to " + target_pos.get_name()+" at "+str(pos))
		eventOwner.set_pos(pos)
	pass

func find_node(node):
	return self.main_node.find_node(node)
	pass
	
func _get_main_node():
	var root = get_tree().get_root()
	return root.get_child( root.get_child_count()-1 )
	pass