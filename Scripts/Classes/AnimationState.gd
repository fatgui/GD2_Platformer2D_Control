var animPlayer = null;
var animation_state = "";
var current_animation = "";

func _init(anim):
	animPlayer = anim;
	
	
func Apply(moveControl):
	
	var inMove = moveControl.velocity.x!=0;

	# if is in move
	if inMove:
		# RIGHT 
		if moveControl.velocity.x > 0:
			# => set sprite orientation to RIGTH
			moveControl.object.get_node("PlayerAnimation").get_node("Sprite").set_flip_h(false);
		if moveControl.velocity.x < 0:
			# => set sprite orientation to LEFT
			moveControl.object.get_node("PlayerAnimation").get_node("Sprite").set_flip_h(true);
	
	if moveControl.isOnGround:
		if moveControl.velocity.x!=0:
			if !moveControl.object.is_colliding():
				animation_state = "Walk"
		else:
			animation_state = "Idle"
	else:
		if moveControl.velocity.y>0:
			animation_state = "Fall"
			
	if moveControl.jumping and moveControl.velocity.y<0: 
		animation_state = "Jump"
		
		
	if current_animation != animation_state:
		animPlayer.play(animation_state)
		current_animation = animation_state
	
	