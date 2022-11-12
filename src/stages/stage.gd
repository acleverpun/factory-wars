@tool
extends Node2D

const camScript := preload("res://src/components/camera.gd")

@export var title: String
@export var description: String

@onready var map = $"map"

func _ready() -> void:
	if Engine.is_editor_hint():
		return _readyEditor()

func _readyEditor() -> void:
	if not self.has_node("entities"):
		var entities = Node.new()
		entities.name = "entities"
		self.add_child(entities)
		entities.set_owner(get_tree().edited_scene_root)

	if not self.has_node("camera"):
		var cam = Camera2D.new()
		cam.name = "camera"
		cam.current = true
		cam.set_script(camScript)
		self.add_child(cam)
		cam.set_owner(get_tree().edited_scene_root)
