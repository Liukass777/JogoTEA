extends Area2D


func _ready() -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	body.victory()


func _on_deadzone_body_entered(body: Node2D) -> void:
	body.killed()
	
