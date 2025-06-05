extends CharacterBody2D

var velX = 500
var grav = 1500
var jump = false
var jump_release = false
var was_on_floor = false
var controled_jump = false

enum {IDLE, RUNNING, FLYING, DEAD, VICTORY}

var mask = collision_mask
var layer = collision_layer

var status = RUNNING

func _ready():
	set_process_input(true)


func _physics_process(delta):
	if status == RUNNING:
		running(delta)
	elif status == DEAD:
		dead(delta)
	elif status == FLYING:
		flying(delta)
	
	if status != DEAD:
		if position.y > ProjectSettings.get_setting("display/window/size/viewport_height"):
				killed()
	
	jump = false
	jump_release = false
	
func flying(delta):
	velocity.y += grav * delta
	velocity.x = velX
	move_and_slide()
	if jump:
		$wings/animwings.play("fly")
		jumping(400, false)
		$flap.play()
		
	if is_on_floor():
		powerup_finished()

func running(delta):
	velocity.y += grav * delta
	velocity.x = velX
	move_and_slide()
	
	if is_on_floor():
			if not was_on_floor:
				$AnimationPlayer.play("boing")
				$Node2D/anim_dust.play("dust")
			if jump:
				jumping(1000, true)
				$jump.play()
			$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("jump")
		if jump_release and velocity.y < 0 and controled_jump:
			velocity.y *= .3
	
	was_on_floor = is_on_floor()
	
func dead(delta):
	$AnimatedSprite2D.play("hurt")
	
	translate(velocity * delta)
	velocity.y += grav * delta
		

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
					jump = true
		else:
			jump_release = true
	pass
	
func jumping(force, controled):
	velocity.y = -force
	controled_jump = controled

func killed():
	if status != DEAD:
		status = DEAD
		collision_mask = 0
		collision_layer = 0
		velocity = Vector2(0, -1000)
		$dead.play()
		await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://zMINIGAMES/jogo celular/scenes/fase.tscn")

		
func fly():
	jumping(400, false)
	status = FLYING
	$wings.visible = true
	
func powerup_finished():
	if status != DEAD:
		status = RUNNING
		$wings.hide()
		$AnimatedSprite2D.play("walk")
		

func victory():
	status = VICTORY
	$AnimatedSprite2D.play("victory")
	$victory.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/youwin.tscn")
