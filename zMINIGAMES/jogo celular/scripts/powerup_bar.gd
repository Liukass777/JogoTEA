extends Node2D

var bar_size: Vector2

func _ready() -> void:
	visible = false
	
	var bar_node = get_node_or_null("bar")
	if bar_node and bar_node is Control:
		bar_size = (bar_node as Control).size
		
		
func start(time) :
	visible = true
	var tween = create_tween()
	tween.tween_method(Callable(self, "count"),1.0,0.0, time) \
		.set_ease(Tween.EASE_IN) \
		.set_trans(Tween.TRANS_LINEAR)
		
	tween.finished.connect(tween_finished)
		
func tween_finished():
	get_tree().call_group("player","powerup_finished")
	visible = false

func count(val):
	var bar_node: Control = get_node_or_null("bar") as Control
	bar_node.size = Vector2(bar_size.x * val, bar_size.y)
