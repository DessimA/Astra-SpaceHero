extends Camera2D
var velocidade_back = 200
func _ready():
	set_process(true)
	pass
func _process(delta):
		set_offset(get_offset() +Vector2(0, -1) * velocidade_back * delta)
		pass
