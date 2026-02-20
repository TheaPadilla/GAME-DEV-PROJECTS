extends CharacterBody3D

@export var speed = 6.0
@export var jump_velocity = 5.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") # 9.8 by default

func _physics_process(delta):
	var direction = Vector3.ZERO

	# Get input
	if Input.is_action_pressed("move_up"):
		direction.z -= 1
	if Input.is_action_pressed("move_down"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	direction = direction.normalized()

	# Transform input to global direction
	var forward = -global_transform.basis.z
	var right = global_transform.basis.x
	var move_dir = (forward * direction.z + right * direction.x).normalized() if direction != Vector3.ZERO else Vector3.ZERO

	# Apply horizontal velocity
	velocity.x = move_dir.x * speed
	velocity.z = move_dir.z * speed

	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Move character
	move_and_slide()
