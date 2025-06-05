extends StaticBody2D

var textures = [
	"res://zMINIGAMES/jogo celular/assets/Environment/ground_cake.png",
	"res://zMINIGAMES/jogo celular/assets/Environment/ground_grass.png",
	"res://zMINIGAMES/jogo celular/assets/Environment/ground_sand.png",
	"res://zMINIGAMES/jogo celular/assets/Environment/ground_snow.png",
	"res://zMINIGAMES/jogo celular/assets/Environment/ground_stone.png",
	"res://zMINIGAMES/jogo celular/assets/Environment/ground_wood.png"
]
	
@export_enum("CAKE", "GRASS", "SAND", "STONE", "WOOD", "SNOW") var texture_type: int = 0:
	set(value):
		texture_type = value
		if is_inside_tree() and Engine.is_editor_hint():
			queue_redraw()

func _ready():
	if get_node_or_null("GroundCake"):
		$GroundCake.texture = load(textures[texture_type])
	else:
		print("Nó 'sprite' não encontrado como filho de StaticBody2D.")
		
func _draw():
	if get_node_or_null("GroundCake"):
		$GroundCake.texture = load(textures[texture_type])
	
