class_name Component extends Node

export(bool) var enabled = true

onready var entity := get_parent()
onready var stage: Stage = get_tree().current_scene

func _ready() -> void:
	entity.add_to_group(self.name)

	entity.components[self.name] = self

func proxy(target: Node, property: String, namespace: String = "proxy") -> void:
	# TODO: proxy property at path from source to target
	pass

func enable(_enabled := true) -> void:
	enabled = _enabled

func toggle() -> void:
	enabled = not enabled
