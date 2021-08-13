class_name Component extends Node

@export var enabled := true

# TODO: vet making Components class
@onready var components := get_parent()
@onready var entity := components.get_parent()

func _ready() -> void:
	entity.add_to_group(self.name)
	if has_method("_setup"):
		call_deferred("_setup")

func enable(_enabled := true) -> void:
	enabled = _enabled

func toggle() -> bool:
	enabled = not enabled
	return enabled
