extends CharacterBody2D

@export var speed = 200
@export var jump_force = -400
@export var gravity = 900

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = 0

	if Input.is_action_pressed("p2_right"):
		direction += 1
	if Input.is_action_pressed("p2_left"):
		direction -= 1

	velocity.x = direction * speed

	if Input.is_action_just_pressed("p2_jump") and is_on_floor():
		velocity.y = jump_force

	move_and_slide()
