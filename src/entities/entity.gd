class_name Entity extends Node2D

onready var id := get_instance_id()
onready var map: Map = get_tree().current_scene
onready var layer := get_parent()

func _ready() -> void:
	call_deferred("setup")

func setup() -> void:
	# set EID in map data
	map.layers.setData(layer.name, grid.toGrid(self.position), id)
