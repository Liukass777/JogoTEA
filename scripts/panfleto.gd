extends Area2D

@onready var label_interacao: Label = $label_interacao
@onready var caixa_dialogo: Label = $CanvasLayer/caixa_dialogo
@onready var texto_dialogo: Label = $CanvasLayer/texto_dialogo
@onready var fala1 = $fala1 as AudioStreamPlayer
@onready var fala2 = $fala2 as AudioStreamPlayer

var player_in_area = false
var falando = false
var pode_avançar = false
var fala_index = 0


var falas = [
	"O Transtorno do Espectro Autista (TEA) é uma condição que afeta a comunicação, a interação social e o comportamento. Cada pessoa com autismo é única e pode ter dificuldades ou habilidades específicas. Não é uma doença, e com apoio, é possível levar uma vida plena.",
	"O diagnóstico do TEA pode ser feito na infância, mas também em adultos. Os sinais variam bastante, como dificuldade em manter contato visual, preferir rotinas ou ter interesses muito intensos. O acompanhamento com profissionais — como psicólogos, fonoaudiólogos e terapeutas ocupacionais — pode ajudar no desenvolvimento e na qualidade de vida."
]

func _ready() -> void:
	caixa_dialogo.visible = false
	texto_dialogo.visible = false
	label_interacao.visible = false

func _process(_delta)->void:
	if player_in_area and not falando and Input.is_action_just_pressed("interact"):
		fala1.play()
		iniciar_dialogo()
	elif falando and pode_avançar and Input.is_action_just_pressed("interact"): 
		if fala1.playing:
			fala1.stop()  # Para o áudio atual, se estiver tocando
		fala2.play()      # Reproduz do início, sem sobrepor
		proxima_fala()


func _on_body_entered(body) -> void:
	if body.name == "player":
		player_in_area = true
		label_interacao.text = "Pressione 'E' para interagir"
		label_interacao.visible = true

func _on_body_exited(body) -> void:
	if body.name == "player":
		player_in_area = false
		label_interacao.visible = false
		if falando:
			encerrar_dialogo()

func iniciar_dialogo():
	falando = true
	label_interacao.visible = false
	caixa_dialogo.visible = true
	texto_dialogo.visible = true
	fala_index = 0
	proxima_fala()

func proxima_fala():
	if fala_index < falas.size():
		pode_avançar = false
		texto_dialogo.text = ""
		var texto = falas[fala_index]
		fala_index += 1
		mostrar_texto_com_efeito(texto)
	else:
		encerrar_dialogo()

func mostrar_texto_com_efeito(texto: String):
	await get_tree().create_timer(0.1).timeout
	for letra in texto:
		texto_dialogo.text += letra
	await get_tree().create_timer(0.02).timeout
	pode_avançar = true


func encerrar_dialogo():
	falando = false
	pode_avançar = false
	caixa_dialogo.visible = false
	texto_dialogo.visible = false
	fala1.stop()
	fala2.stop()
