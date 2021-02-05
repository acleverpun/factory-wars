extends Node

onready var parent := get_parent()
onready var layer: TileMap = parent.get_parent()
onready var grid: Grid = layer.get_parent()
