extends ParallaxBackground

@export var layer_modulates: Array[Color] = [
	Color(1,1,1,1),
	Color(1,1,1,1),
	Color(1,1,1,1),
	Color(1,1,1,1),
]:
	set(value):
		layer_modulates = value
		if Engine.is_editor_hint():
			apply_layer_color()
			
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_layer_color()
	
func apply_layer_color():
	var background_names = ["ParallaxLayer/BgLayer1", "ParallaxLayer/BgLayer2", "ParallaxLayer/BgLayer3", "ParallaxLayer/BgLayer4"]
	
	for i in range(min(background_names.size(), layer_modulates.size())):
		var node_name = background_names[i]
		var target_color = layer_modulates[i]
		
		var bg_layer: CanvasItem = get_node_or_null(node_name) as CanvasItem
		
		if bg_layer:
			bg_layer.modulate = target_color
		else:
			push_warning("Nó não encontrado")
