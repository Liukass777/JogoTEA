extends Area2D

@export var time = 10.0

func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	get_tree().call_group("powerupBAR", "start", time)
	body.fly()
	queue_free()
