#MENU
extends Button

func _ready():
	pass

func _process(delta):
	pass

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/q1.tscn")
