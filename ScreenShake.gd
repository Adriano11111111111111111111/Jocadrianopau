extends Node2D

var amplitude = 0

onready var camera = get_parent()

func new_shaker():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	
	$ShakeTween.interpolate_property()
