extends Node

onready var entity := get_parent()
onready var layer: TileMap = entity.get_parent()
onready var grid: Grid = layer.get_parent()
