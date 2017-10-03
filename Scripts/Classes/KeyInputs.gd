var assigned_key = ""
var current_state
var input

func _init(key_name):
	self.assigned_key = key_name 
	
func Check():
	input = Input.is_action_pressed(self.assigned_key)	
	current_state = input 
	
#	if input:
#		print("KEY "+assigned_key+" = true")
#	else:
#		print("KEY "+assigned_key+" = false")

	return current_state
	

