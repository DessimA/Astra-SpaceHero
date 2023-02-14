extends Node2D
var velocidade = 250
var rotacao = 0

func _ready():
	randomize() # reseta a semente
	set_process(true)
	rotacao = rand_range(-3, 3) # randomiza entre -2 e 2 a rotação

func _process(delta):
	position += Vector2(0, 1) * velocidade * delta
	rotate(rotacao * delta) # rotaciona o meteoro