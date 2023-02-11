extends Area2D

var velocity = 500

func _ready():
	set_process(true)
	# Adicione uma forma de colisão ao tiro
	var shape = CollisionShape2D.new()
	shape.shape = CircleShape2D.new()
	shape.shape.radius = 5
	add_child(shape)

func _process(delta):
	# Movimente o tiro
	set_position(get_position() + Vector2(0, -1) * velocity * delta)
	# Se o tiro sair da tela, remova-o da cena
	if get_position().y < -30:
		queue_free()

func _on_tiro_area_entered(area):
	if area.is_in_group(Game.METEORO): # Identifica o meteoro por grupo
		area.queue_free() # Destrói o meteoro
