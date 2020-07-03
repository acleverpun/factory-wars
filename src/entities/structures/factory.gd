extends Polygon2D

const Unit = preload("res://src/entities/units/unit.tscn")

export var value := 0

onready var parent = get_parent()

func onSelect():
	spawn()

func spawn():
	if value < 20:
		prints("value not high enough", value)
		value += 10
		return

	value -= 20
	var unit = Unit.instance()
	unit.position = self.position + Vector2(0, 32)
	parent.add_child(unit)
