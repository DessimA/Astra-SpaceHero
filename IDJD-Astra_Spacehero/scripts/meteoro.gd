extends RigidBody2D

const speed = 250
var rotation_value = 0

func _ready():
	add_to_group(Game.METEORO) # Adicionamos nosso meteoro a seu devido grupo
	randomize()
	set_process(true)
	# Adicione uma forma de colisão ao meteoro
	var shape = CollisionPolygon2D.new()
	shape.set_deferred("points", [Vector2(-10, -10), Vector2(10, -10), Vector2(0, 10)])
	add_child(shape)
	rotation_value = rand_range(-3.0, 3.0)

func _process(delta):
	set_position(get_position() + Vector2(0, 1) * speed * delta)
	rotate(rotation_value * delta)
	# Adicione essas linhas abaixo para verificar a colisão
	var tiro = get_parent().get_node("Tiro")
	if tiro and tiro.is_colliding_with(self):
		Game.pontos += 10 # Apenas incrementa o pontos se ocorreu colisão
		tiro.queue_free() # Destrói o tiro após colisão
		queue_free() # Destrói o meteoro após colisão
