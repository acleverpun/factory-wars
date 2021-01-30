extends Area2D

signal selected
signal deselected

onready var parent := get_parent()
onready var layer: TileMap = parent.get_parent()
onready var grid: Grid = layer.get_parent()

func _ready() -> void:
	if parent.has_method("_onSelected"): connect("selected", parent, "_onSelected")
	if parent.has_method("_onDeselected"): connect("deselected", parent, "_onDeselected")

	var selectable = grid.getData(parent.position, "selectable", {})
	selectable[layer.name] = parent
	grid.setData(parent.position, "selectable", selectable)
