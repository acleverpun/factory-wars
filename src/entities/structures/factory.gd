extends Polygon2D

const Unit = preload("res://src/entities/units/unit.tscn")

export var value := 0

onready var tilemap: TileMap = get_parent()
onready var grid: Grid = tilemap.get_parent()

func _onSelected():
	spawn()

func spawn():
	if grid.getData("units", self.position) != -1: return

	if value < 20:
		prints("value not high enough", value)
		value += 10
		return

	value -= 20
	grid.addNode(Unit, "units", self.position)
