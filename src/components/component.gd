class_name Component extends Node

onready var entity := get_parent()
onready var map: Map = get_tree().current_scene

func _ready() -> void:
	entity.add_to_group(self.name)
