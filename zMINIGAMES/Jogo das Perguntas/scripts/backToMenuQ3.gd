#BACKTOMENUQ3
extends Button
@onready var acertoq = $"../q_errada" as AudioStreamPlayer
func _ready():
	pass

func _process(delta):
	pass


#QUEST3

#botão 1
func _on_pressed() -> void:
	acertoq.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/MainMenu.tscn")

#botão 2 é a certa

#botão 3
func _on_button_3_pressed() -> void:
	acertoq.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/MainMenu.tscn")
#botão 4
func _on_button_4_pressed() -> void:
	acertoq.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://zMINIGAMES/Jogo das Perguntas/scenes/MainMenu.tscn")
