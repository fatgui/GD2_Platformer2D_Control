extends EditorPlugin
tool
var path = 'res://addons/game_entities/'

func _enter_tree():
	add_custom_type("GAME_Coin", "Area2D", load(path+'game_node_coin.gd'), load(path+'game_node_icon_coin.png'))
	
func _exit_tree():
	remove_custom_type("GAME_Coin")
	