extends Label
func _ready():
	set_process(true)
	pass
func _process(delta):
	set_text(String(game.pontos)) #convertemos nosso tipo inteiro para texto (string)
	pass
