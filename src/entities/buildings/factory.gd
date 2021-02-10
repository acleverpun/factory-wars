extends Entity

const Unit = preload("res://src/entities/units/unit.tscn")

export var value := 0

func spawn() -> void:
	if value < 20:
		prints("value not high enough", value)
		value += 10
		return

	value -= 20

	# TODO: spawn unit again
