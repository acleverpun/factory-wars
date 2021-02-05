extends Area2D

signal selected
signal deselected

export(Mode.values) var intent

onready var parent := get_parent()
onready var layer: TileMap = parent.get_parent()
onready var grid: Grid = layer.get_parent()

func _ready() -> void:
	var selecting = grid.getData(parent.position, "selecting", {})
	selecting[layer.name] = parent
	grid.setData(parent.position, "selecting", selecting)
