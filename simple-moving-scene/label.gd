extends Label

@export var speed := 80.0
@export var float_height := 20.0

var time := 0.0
var start_y := 0.0

func _ready():
	start_y = position.y

func _process(delta):
	time += delta
	position.x += speed * delta
	position.y = start_y + sin(time * 2.0) * float_height
