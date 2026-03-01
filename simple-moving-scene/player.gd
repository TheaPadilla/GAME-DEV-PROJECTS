extends CharacterBody3D

@export var forward_speed = 6.0
@export var side_speed = 5.0
@export var jump_velocity = 5.0
@export var gravity = 9.8

var score = 0.0
var score_label

@onready var walk_sound = get_node_or_null("WalkSound")
@onready var hit_sound = get_node_or_null("HitSound")
@onready var jump_sound = get_node_or_null("JumpSound")


func _ready():
	score_label = get_tree().current_scene.get_node_or_null("HUD/ScoreLabel")


func _physics_process(delta):

	velocity.z = -forward_speed

	var side = Input.get_action_strength("ui_right") \
		- Input.get_action_strength("ui_left")
	velocity.x = side * side_speed

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		if jump_sound:
			jump_sound.play()

	move_and_slide()

	handle_walk_sound()

	score += delta * 10
	if score_label:
		score_label.text = "Score: " + str(int(score))


func handle_walk_sound():

	if walk_sound == null:
		return

	var moving = abs(velocity.x) > 0.1 or abs(velocity.z) > 0.1

	if is_on_floor() and moving:
		if not walk_sound.playing:
			walk_sound.play()
	else:
		walk_sound.stop()


func play_hit_sound():
	if hit_sound:
		hit_sound.play()
