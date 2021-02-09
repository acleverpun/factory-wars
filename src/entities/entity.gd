class_name Entity extends Node2D

onready var layer: TileMap = get_parent()
onready var grid: Grid = layer.get_parent()
onready var id := get_instance_id()

func _ready() -> void:
	grid.setData(self.position, layer.name, id)
