class_name Mode extends Node

enum Type {
	None,
	Select,
	Move,
	Build,
	Place,
}

var type: int
var data: Dictionary

onready var map: Map = get_tree().current_scene
onready var modes: Modes = get_parent()

func _init(_type = Type.None, _data: Dictionary = {}):
	type = _type
	setData(_data)

func setData(_data: Dictionary) -> void:
	if _data == null: return
	data = _data
