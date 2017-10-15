
extends Node2D


# Getting globals (values from the Scene menu -> Project Settings). An alternative is OS.get_window_size()
onready var screen_size = Vector2(Globals.get("display/width"), Globals.get("display/height")) 
onready var player = get_node("Player")
onready var HUD = get_node("HUD")

export var smoothFollow = true
export var smoothSpeed = 0.1

var old_pos
var new_pos
var canvas_transform

func _ready():
	# Initializes the camera, sets its position to that of the player
	update_camera()
	# Instead of connecting the signal from the editor, we can do this via code. We connect from the player (using the player variable) to the camera (the self argument below).
	# However, I prefer to do this in the editor as it'll display an icon, making it easy to spot connections later
	player.connect("moveSignal", self, "update_camera")
	if smoothFollow: set_process(true)
	
# Center the camera on the player. Automatically called when the player moves.
func update_camera():
	canvas_transform = get_viewport().get_canvas_transform()
	# canvas_transform is of type Matrix32. That's an array of 3 Vector2, and canvas_transform[2] controls the canvas's offset.
	# Moving a camera isn't moving a camera per se, instead we move the canvas (all the sprites) under the camera. That's why we use -1*player.get_pos()
	old_pos = canvas_transform[2]
	new_pos = -player.get_pos() + screen_size / 2	
	
	if !smoothFollow: 
		canvas_transform[2].x = new_pos.x
		canvas_transform[2].y = new_pos.y
		get_viewport().set_canvas_transform(canvas_transform)
		HUD.set_pos(-canvas_transform[2])
	
func _process(delta):

	canvas_transform = get_viewport().get_canvas_transform()
	# canvas_transform is of type Matrix32. That's an array of 3 Vector2, and canvas_transform[2] controls the canvas's offset.
	# Moving a camera isn't moving a camera per se, instead we move the canvas (all the sprites) under the camera. That's why we use -1*player.get_pos()
	old_pos = canvas_transform[2]
	new_pos = -player.get_pos() + screen_size / 2	
		
	new_pos.x = lerp(old_pos.x, new_pos.x,smoothSpeed)
	new_pos.y = lerp(old_pos.y, new_pos.y,smoothSpeed)
	canvas_transform[2].x = new_pos.x
	canvas_transform[2].y = new_pos.y
	get_viewport().set_canvas_transform(canvas_transform)
	HUD.set_pos(-canvas_transform[2])