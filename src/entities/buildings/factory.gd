class_name Factory extends Building

const UnitScene = preload("res://src/entities/units/unit.tscn")

export var value := 0
export(Array, Resource) var unitList = []

func spawn() -> void:
	if value < 20:
		prints("value not high enough", value)
		value += 10
		return

	value -= 20

	# TODO: spawn unit again
