#NEXTQUESTION
extends Button

func _ready():
	pass

func _process(delta):
	pass

#QUESTÃO 1 - PRIMEIRO BOTÃO
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/q2.tscn")

#QUESTÃO 2 - TERCEIRO BOTÃO
func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/q3.tscn")

#QUESTÃO 3 - SEGUNDO BOTÃO
func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/q4.tscn")

#QUESTÃO 4 - QUARTO BOTÃO
func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/youwin.tscn")
