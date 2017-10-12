var assigned_key = ""
var current_state
var input

# -----------------------------------------------------------
# Input class Contructor
# -----------------------------------------------------------
func _init(key_name):
	self.assigned_key = key_name 
	
# -----------------------------------------------------------
# Check pressed or released
# -----------------------------------------------------------	
func Check(checkRelease = false):

	
	if !checkRelease:
		input = Input.is_action_pressed(self.assigned_key)	
	else:
		input = Input.is_action_released(self.assigned_key)	

	current_state = input 	
	return current_state
	

# -----------------------------------------------------------
# Check if is pressed 
# -----------------------------------------------------------	
func Pressed():
	
	input = Input.is_action_pressed(self.assigned_key)	
	current_state = input 	
	return current_state
	
# -----------------------------------------------------------
# Check if is released
# -----------------------------------------------------------	
func Released():
	
	input = Input.is_action_released(self.assigned_key)	
	current_state = input 	
	return current_state
