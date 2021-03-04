class_name Mode extends Node

enum Type {
	None,
	Select,
	Move,
	Build,
	Place,
}

# `Type`
var type: int

# the piror state, if any
var prior: Node

# arbitrary data
var data: Dictionary

onready var map: Map = get_tree().current_scene
onready var modes: Modes = get_parent()

func _init(_type = Type.None, _prior: Node = null, _data: Dictionary = {}):
	type = _type
	prior = _prior
	setData(_data)

func setData(_data: Dictionary) -> void:
	if _data == null: return
	data = _data
