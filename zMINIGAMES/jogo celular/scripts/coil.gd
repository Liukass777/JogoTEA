extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	body.jumping(1500, false)
	$sprite.play("action")
	$coil.play()
