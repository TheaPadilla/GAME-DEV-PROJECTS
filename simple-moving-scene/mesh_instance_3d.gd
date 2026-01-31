extends MeshInstance3D

@export var spin_speed := 2.0

func _process(delta):
	rotation.y += spin_speed * delta
