extends EditorPlugin
tool
var path = 'res://addons/game_entities/'

func _enter_tree():
	add_custom_type("GAME_Coin", "Area2D", load(path+'game_node_coin.gd'), load(path+'game_node_icon_coin.png'))
	add_custom_type("GAME_Ammo", "Area2D", load(path+'game_node_ammo.gd'), load(path+'game_node_icon_ammo.png'))
	add_custom_type("GAME_Health", "Area2D", load(path+'game_node_health.gd'), load(path+'game_node_icon_health.png'))
	add_custom_type("GAME_Teleport", "Area2D", load(path+'game_node_teleport.gd'), load(path+'game_node_icon_teleport.png'))
	add_custom_type("GAME_JumpPowerUp", "Area2D", load(path+'game_node_jump_powerup.gd'), load(path+'game_node_icon_jump_powerup.png'))
	add_custom_type("GAME_SpeedPowerUp", "Area2D", load(path+'game_node_speed_powerup.gd'), load(path+'game_node_icon_speed_powerup.png'))
	add_custom_type("GAME_GravityPowerUp", "Area2D", load(path+'game_node_gravity_powerup.gd'), load(path+'game_node_icon_gravity_powerup.png'))
	
func _exit_tree():
	remove_custom_type("GAME_Coin")
	remove_custom_type("GAME_Ammo")
	remove_custom_type("GAME_Health")
	remove_custom_type("GAME_Teleport")
	remove_custom_type("GAME_JumpPowerUp")
	remove_custom_type("GAME_SpeedPowerUp")
	remove_custom_type("GAME_GravityPowerUp")
	