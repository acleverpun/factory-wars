class_name Mode extends Node

enum Type {
	Null,
	Select,
	Move,
}

var value

onready var map: Map = get_tree().current_scene

func _init(arg = null):
	value = arg
