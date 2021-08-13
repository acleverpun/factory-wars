class_name Entity extends Node2D

@export var team: int

func _ready() -> void:
	if has_method("ready"):
		call_deferred("ready")
