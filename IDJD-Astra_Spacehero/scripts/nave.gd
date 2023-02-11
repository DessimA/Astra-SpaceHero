extends KinematicBody2D

var sprite_tiro = preload("res://scenes/Tiro.tscn")
var espera = .2
var disparo = 0
var velocidade = 500 # velocidade da nave em pixels/segundo

func _ready():
	set_process(true)

func _on_nave_area_enter(area):
	if area.is_in_group(Game.METEORO):
		Game.vidas -= 1 # retiramos uma vida quando somos acertados
		area.queue_free()

func _process(delta):
	var d = 0 # 1 para pressionado para a direita
	var e = 0 # -1 para pressionado para a esquerda, inverte cálculo da posição
	
	if Input.is_action_pressed("direita"):
		d = 1 # validamos que direita foi pressionada
	if Input.is_action_pressed("esquerda"):
		e = -1 # validamos que esquerda foi pressionada, -1 para inverte cálculo
	
	if get_position().x > (800 - 50):
		d = 0
	if get_position().x < 50:
		e = 0

	# Cálculo de posicionamento a uma velocidade constante a cada frame
	set_position(get_position() + Vector2(velocidade, 0) * delta * (d + e))
	
	if Input.is_action_pressed("tiro"):
		if disparo <= 0:
			var tiro = sprite_tiro.instance()
			tiro.set_global_position(get_global_position())
			get_node("../").add_child(tiro)
			disparo = espera
		if disparo > 0:
			disparo -= delta
			
	if Game.vidas <= 0:
		Game.vidas = 3
		Game.pontos = 0
	get_tree().reload_current_scene() # reinicia a cena atual
