tool
extends Polygon2D

onready var Arrow := preload("res://src/gui/arrow.tscn")

# TODO: move to universal storage
enum IOType { INPUT, OUTPUT }

# TODO: move to universal storage
enum Direction {
	EAST = 1 << 0,
	SOUTH = 1 << 1,
	WEST = 1 << 2,
	NORTH = 1 << 3,
}

export(Direction, FLAGS) var inputs = 0
export(Direction, FLAGS) var outputs = 0

onready var sides = {
	Direction.EAST: null,
	Direction.SOUTH: null,
	Direction.WEST: null,
	Direction.NORTH: null,
}

func _draw():
	var d := 0
	for dir in Direction:
		if outputs & Direction[dir]:
			drawArrow(d * PI/2, IOType.OUTPUT)
		if inputs & Direction[dir]:
			drawArrow(d * PI/2, IOType.INPUT)
		d += 1

func drawArrow(angle: float, ioType: int):
	var color := Color.tomato if ioType == IOType.INPUT else Color.lawngreen
	var arrow := Arrow.instance()
	color.a = 0.8
	arrow.rotate(angle)
	arrow.find_node("body").color = color

	if ioType == IOType.INPUT:
		arrow.find_node("center").rotate(PI)

	add_child(arrow)
