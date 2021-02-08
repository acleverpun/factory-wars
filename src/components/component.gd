class_name Component extends Node

onready var entity := get_parent()

func _ready() -> void:
	entity.add_to_group(self.name)
