extends Area2D

@export var vel = 6

func _ready():
	pass 

func _process(_delta):
	if Input.is_action_pressed("left"):
		position.x -= vel
	if Input.is_action_pressed("right"):
		position.x += vel
