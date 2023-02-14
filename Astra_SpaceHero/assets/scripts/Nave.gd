extends Node2D
var velocidade = 300 # velocidade da nave em pixels/segundo
func _ready():
	set_process(true)
	pass
func _process(delta):
	# variaveis de verificação
	var d = 0 # 1 para pressionado para direita
	var e = 0 # -1 para pressionado para esquerda, inverte caçulo da posição
	# condição de verificação se a tecla configurada para direita foi ativada
	if Input.is_action_pressed("ui_right"):
		d = 1 # validamos que direita foi pressionado
	if Input.is_action_pressed("ui_left"):
		e = -1 # validamos que esquerda foi pressionado, -1 par inverter cálculo
	if get_position().x > (800 - 50):
		d = 0
	if get_position().x < 50:
		e = 0

	# Cálculo de posicionamento a uma velocidade constante a cada frame
	position += Vector2(velocidade, 0) * delta * (d + e)
	pass
