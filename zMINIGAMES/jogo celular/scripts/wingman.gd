extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	

func _on_body_body_entered(body: Node2D) -> void:
	body.killed()


func _on_head_body_entered(body: Node2D) -> void:
	body.jumping(800, false)
	$Node2D.visible = true
	$AnimationPlayer.play("destroy")
	$enemyhurt.play()
	$wingtimer.start()


func _on_wingtimer_timeout() -> void:
	queue_free()
