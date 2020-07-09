extends Polygon2D

const Unit = preload("res://src/entities/units/unit.tscn")

export var value := 0

onready var tilemap := get_parent() as TileMap
onready var grid := tilemap.get_parent()

func onSelect():
	spawn()

func spawn():
	if value < 20:
		prints("value not high enough", value)
		value += 10
		return

	value -= 20
	grid.addNode(Unit, "units", self.position + Vector2(0, 32))
