extends Node2D

var sprite_tiro = preload("res://assets/scenes/Tiro.tscn")
var velocidade = 500
var espera = .2
var disparo = 0

func _ready():
	set_process(true)

func _process(delta):
	# variaveis de verificação
	var d = 0 # 1 para pressionado para direita
	var e = 0 # -1 para pressionado para esquerda, inverte caçulo da posição
	# condição de verificação se a tecla configurada para direita foi ativada
	if Input.is_action_pressed("ui_right"):
		d = 1 # validamos que direita foi pressionado
	if Input.is_action_pressed("ui_left"):
		e = -1 # validamos que esquerda foi pressionado, -1 par inverter cálculo
	if position.x > (800 - 50):
		d = 0
	if position.x < 50:
		e = 0
	# Cálculo de posicionamento a uma velocidade constante a cada frame
	position += Vector2(velocidade, 0) * delta * (d + e)

	if Input.is_action_pressed("ui_select"):
		if disparo <= 0:
			var tiro = sprite_tiro.instance()
			tiro.set_global_position(global_position)
			get_node("../").add_child(tiro)
			disparo = espera
	if disparo > 0:
		disparo -= delta
	pass
