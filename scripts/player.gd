extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	pass

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction2 = Input.get_axis("up", "down")
	var direction = Input.get_axis("left", "right")
	if direction or direction2:
		velocity.y = direction2 * SPEED
		velocity.x = direction * SPEED
		$AnimationSprite2D.play("andando")

	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimationSprite2D.pause()
	move_and_slide()


	if direction == -1:
		$AnimationSprite2D.flip_h = true
	if direction == 1:
		$AnimationSprite2D.flip_h = false
