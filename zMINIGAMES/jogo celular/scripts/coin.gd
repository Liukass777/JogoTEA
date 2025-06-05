extends Area2D


func _on_body_entered(body: Node2D) -> void:
	$coin.play()
	$coinsprite.visible = false
	collision_mask = 0
	$queue_timer.start()
	$coinparticles.emitting = true
	get_tree().call_group("coin_counter", "pick_coin")


func _on_queue_timer_timeout() -> void:
	queue_free()
