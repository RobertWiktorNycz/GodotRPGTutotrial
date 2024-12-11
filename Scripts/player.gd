extends CharacterBody2D


const speed = 200
var current_direction = "none"
func	_ready():
	$AnimatedSprite2D.play("FrontIdle")
func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_direction ="right"
		#play animation right
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction ="left"
		#play animation left
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction ="down"
		#play animation down
		play_animation(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_direction ="up"
		#play animation up
		play_animation(1)
		velocity.x = 0
		velocity.y = -speed
	else :
		play_animation(0)
		velocity.x = 0
		velocity.y = 0

	move_and_slide()

func play_animation(movement):
	var direction = current_direction
	var animation = $AnimatedSprite2D
	
	if direction == "right":
		animation.flip_h = false
		if movement == 0:
			animation.play("SideIdle")
		elif movement == 1:
			animation.play("SideWalk")
	if direction == "left":
		animation.flip_h = true
		if movement == 0:
			animation.play("SideIdle")
		elif movement == 1:
			animation.play("SideWalk")
	if direction == "down":
		animation.flip_h = false
		if movement == 0:
			animation.play("FrontIdle")
		elif movement == 1:
			animation.play("FrontWalk")
	if direction == "up":
		animation.flip_h = false
		if movement == 0:
			animation.play("BackIdle")
		elif movement == 1:
			animation.play("BackWalk")
