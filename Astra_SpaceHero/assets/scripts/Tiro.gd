extends Area2D

var velocidade = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	position += Vector2(0, -1) * velocidade * delta
	if position.y < -30:
		free()
	pass


func _on_Tiro_area_entered(area):
	if area.is_in_group(game.METEORO): # identificaremos nosso meteoro por grupo
		area.queue_free() # destruímos o meteoro
		queue_free() # destruímos o tiro
		game.pontos += 10 #cada meteoro destruído o jogador ganha 10 pontos
		pass
	pass # replace with function body
	
