extends Polygon2D

const Unit = preload("res://src/entities/units/unit.tscn")

onready var parent = get_parent()

func onSelect():
	spawn()

func spawn():
	var unit = Unit.instance()
	unit.position = self.position + Vector2(0, 32)
	parent.add_child(unit)
