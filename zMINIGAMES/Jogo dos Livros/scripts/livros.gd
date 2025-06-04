extends Area2D

var vel = 0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	vel = vel + delta * 2
	position.y = position.y + vel

func _on_area_entered(area: Area2D):
	if area.name == "Cesto":
		get_parent().pontos += 20
		queue_free()
