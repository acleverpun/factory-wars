extends ViewportContainer

onready var Map = preload("res://src/maps/lab.tscn")

func _ready():
	var map = Map.instance()
	add_child(map)

func _input(event):
	if Input.is_action_pressed("game.close"): get_tree().quit()
	if Input.is_action_pressed("game.restart"): get_tree().reload_current_scene()
