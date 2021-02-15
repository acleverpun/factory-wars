class_name Mode extends Node

enum Type {
	None,
	Select,
	Move,
	Build,
}

var value

onready var map: Map = get_tree().current_scene
onready var modes: Modes = get_parent()

func _init(arg = null):
	value = arg
