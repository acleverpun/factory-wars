extends ViewportContainer

onready var Map := preload("res://src/maps/lab.tscn")

var map: Node

func _ready():
	map = Map.instance()
	map.name = "map"
	add_child(map)

func _input(event: InputEvent):
	if Input.is_action_pressed("game.close"): get_tree().quit()
	elif Input.is_action_pressed("game.restart"): get_tree().reload_current_scene()
