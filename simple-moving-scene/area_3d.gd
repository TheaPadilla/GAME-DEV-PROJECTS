extends Area3D

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://lvl1.tscn")

func _ready():
	body_entered.connect(_on_body_entered)
