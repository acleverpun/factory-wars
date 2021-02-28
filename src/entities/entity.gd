class_name Entity extends Node2D

var model: Resource
var components: Dictionary

onready var id := get_instance_id()
onready var map = get_tree().current_scene

func _ready() -> void:
	call_deferred("setup")

func setup() -> void:
	map.addEntity(self)
