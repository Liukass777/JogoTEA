#NEXTQUESTION
extends Button
@onready var acertoq1 = $"../q1" as AudioStreamPlayer
@onready var acertoq2 = $"../q2" as AudioStreamPlayer
@onready var acertoq3 = $"../q3" as AudioStreamPlayer
@onready var acertoq4 = $"../q4" as AudioStreamPlayer
func _ready():
	pass

func _process(delta):
	pass

#QUESTÃO 1 - PRIMEIRO BOTÃO
func _on_pressed() -> void:
	acertoq1.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/q2.tscn")
	

#QUESTÃO 2 - TERCEIRO BOTÃO
func _on_button_3_pressed() -> void:
	acertoq2.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/q3.tscn")
	

#QUESTÃO 3 - SEGUNDO BOTÃO
func _on_button_2_pressed() -> void:
	acertoq3.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/q4.tscn")
	

#QUESTÃO 4 - QUARTO BOTÃO
func _on_button_4_pressed() -> void:
	acertoq4.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/youwin.tscn")
	
