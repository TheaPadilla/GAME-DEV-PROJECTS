extends Label

@export var speed := 80.0
@export var float_height := 20.0
@export var float_speed := 2.0

@onready var appear_sound = get_node_or_null("AppearSound")

var time := 0.0
var start_y := 0.0

func _ready():
	start_y = position.y
	
	# Play sound when label appears
	if appear_sound:
		appear_sound.play()

func _process(delta):
	time += delta
	
	# Move sideways
	position.x += speed * delta
	
	# Floating effect
	position.y = start_y + sin(time * float_speed) * float_height
