@tool
extends Node2D

@export var title: String

@export var description: String

@export var map: PackedScene

func _ready() -> void:
	if Engine.is_editor_hint() and not self.has_node("entities"):
		var node = Node.new()
		node.name = "entities"
		self.add_child(node)
		node.set_owner(get_tree().edited_scene_root)
		return
