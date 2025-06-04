extends Area2D

var vel = 4

func _ready():
	pass 

func _process(delta: float):
	vel = vel + delta * 10
	position.y = position.y + vel
	pass

func _on_area_entered(area: Area2D):
	if area.name == "Cesto":
		get_parent().pontos -= 200
		queue_free()
