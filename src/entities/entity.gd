class_name Entity extends Node2D

# TODO: consider removing now that it's (currently) unused
enum Type {
	None,
	Building,
	Unit,
}

var type = Type.None

onready var id := get_instance_id()
onready var map = get_tree().current_scene

func _ready() -> void:
	assert(type != Type.None, "A None type slipped through.")
	add_to_group(Type.keys()[type])

	call_deferred("setup")

func setup() -> void:
	map.addEntity(self)
