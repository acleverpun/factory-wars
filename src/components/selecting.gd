extends Area2D

signal selected
signal deselected

onready var parent := get_parent()
onready var layer: TileMap = parent.get_parent()
onready var grid: Grid = layer.get_parent()

func _ready() -> void:
	if parent.has_method("_onSelected"): connect("selected", parent, "_onSelected")
	if parent.has_method("_onDeselected"): connect("deselected", parent, "_onDeselected")

	var selecting = grid.getData(parent.position, "selecting", {})
	selecting[layer.name] = parent
	grid.setData(parent.position, "selecting", selecting)
