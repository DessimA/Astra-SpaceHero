extends Node

var sprite_meteor = preload("res://assets/scenes/Meteoro.tscn")
var espera = 2

func _ready():
	set_process(true)

func _process(delta):
	if espera > 0:
		espera -= delta
	else:
		espera = rand_range(0.3, 1)
		var meteoro = sprite_meteor.instance()
		meteoro.set_position(Vector2(rand_range(30, 770), -40))
		get_owner().add_child(meteoro)
