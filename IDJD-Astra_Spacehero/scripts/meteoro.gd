extends Node2D 

const speed = 250
var rotation_value = 0

func _ready():
	add_to_group(Game.METEORO) # Adicionamos nosso meteoro a seu devido grupo
	Game.pontos += 10 # Cada meteoro destruído, o jogador ganha 10 pontos
	randomize()
	set_process(true)
	rotation_value = rand_range(-3.0, 3.0)

func _process(delta):
	set_position(get_position() + Vector2(0, 1) * speed * delta)
	rotate(rotation_value * delta)
