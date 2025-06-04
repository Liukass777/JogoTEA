extends Node2D

@export var objects: Array[PackedScene]

var i = 0
var time = 0
var time_limit = 1
var pos = 0
var pontos = 0

func _ready():
	i = randi_range(0,5)
	pos = randf_range(50,520)

func _process(delta):
	time += delta
	if time > time_limit:
		create_objects()
		time = 0
	$pontos.text = "PEGUE SOMENTE LIVROS MARRONS, VERMELHOS E VERDES: " + str(pontos)
	
func create_objects():
	var obj = objects[i].instantiate()
	obj.position.x = pos
	obj.position.y = -50
	obj.scale = Vector2(0.2,0.2)
	add_child(obj)
	i = randi_range(0,5)
	pos = randf_range(50,520)
	time_limit = randf_range(0.5,1.5)

	if pontos >= 100 : 
		voltar_faze1()
	
func voltar_faze1():
	get_tree().change_scene_to_file("res://scenes/youwin.tscn")
