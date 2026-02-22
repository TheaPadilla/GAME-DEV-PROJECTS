extends CharacterBody3D

@export var forward_speed = 6.0
@export var side_speed = 5.0
@export var jump_velocity = 5.0

func _physics_process(delta):

	# Automatic forward movement
	velocity.z = -forward_speed

	# Side movement (left/right only)
	var side = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = side * side_speed

	# Gravity
	if not is_on_floor():
		velocity.y -= 9.8 * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	move_and_slide()
