extends Area2D
var velocidade = 250
var rotacao = 0

func _ready():
	add_to_group(game.METEORO) # w adcionamos nosso meteoro a seu devido grupo
	game.pontos += 10 #cada meteoro destruído o jogador ganha 10 pontos
	randomize() # reseta a semente
	set_process(true)
	rotacao = rand_range(-3, 3) # randomiza entre -2 e 2 a rotação

func _process(delta):
	position += Vector2(0, 1) * velocidade * delta
	rotate(rotacao * delta) # rotaciona o meteoro
