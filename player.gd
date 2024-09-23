extends CharacterBody2D

const speed = 100
var is_moving = false

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if(!Global.game_over):
		if (Input.is_action_pressed("ui_right")):
			velocity.x = speed
			velocity.y = 0
		elif (Input.is_action_pressed("ui_left")):
			velocity.x = -speed
			velocity.y = 0
		elif (Input.is_action_pressed("ui_down")):
			velocity.x = 0
			velocity.y = speed
		elif (Input.is_action_pressed("ui_up")):
			velocity.x = 0
			velocity.y = -speed
		else:
			velocity.x = 0
			velocity.y = 0
	else:
		velocity.x = 0
		velocity.y = 0
		
		
	play_anim()
	move_and_slide()
	
	#Fixes the issue of sprite pixels being spread to multiple pixels in the viewport
	#Think it is because the position is stored as floats, so when the character is not
	#"aligned" perfectly with the display pixels the render doubles some of them on the edges.
	position.x = round(position.x)
	position.y = round(position.y)
	
func play_anim():
	var anim = $AnimatedSprite2D
	
	if (velocity.x == 0 and velocity.y == 0):
		anim.play("idle")
	elif (velocity.x > 0 and velocity.y == 0):
		anim.play("right")
	elif (velocity.x < 0 and velocity.y == 0):
		anim.play("left")
	elif (velocity.x == 0 and velocity.y < 0):
		anim.play("up")
	else:
		anim.play("walking")
	
	
