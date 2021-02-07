extends Area2D

signal selected
signal deselected

export(Mode.values) var intent

onready var entity := get_parent()
onready var layer: TileMap = entity.get_parent()
onready var grid: Grid = layer.get_parent()

func _ready() -> void:
	var selecting = grid.getData(entity.position, "selecting", {})
	selecting[layer.name] = entity
	grid.setData(entity.position, "selecting", selecting)
