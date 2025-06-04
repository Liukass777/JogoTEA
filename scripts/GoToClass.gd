#MENU
extends Button

func _ready():
	pass

func _process(delta):
	pass

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/fase1.tscn")
