extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("Container/AnimatedSprite2D")
@onready var container = get_node("Container")

var jumps_left = 1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# add jump
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jumps_left = 3  # Reset jumps when on the floor
		elif jumps_left > 0:  # Allow jump
			velocity.y = JUMP_VELOCITY
			jumps_left -= 1  

	# direction
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 1 or direction == -1:
		velocity.x = direction * SPEED
		container.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Animation
	if not is_on_floor():
		anim.play("Jump")
	elif direction != 0:
		anim.play("Run")
	else:
		anim.play("Idle")

	# Move the character
	move_and_slide()



func _on_area_2d_area_entered(area):
	if area.is_in_group("Portal"): 
		get_tree().change_scene_to_file("res://world.tscn")
	
	
