class_name Mode extends Node

enum Type {
	None,
	Select,
	Move,
	Build,
	Place,
}

var type: int
var value

onready var map: Map = get_tree().current_scene
onready var modes: Modes = get_parent()

func _init(_type = Type.None, arg = null):
	type = _type
	value = arg
