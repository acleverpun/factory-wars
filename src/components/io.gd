tool
extends Polygon2D

onready var Arrow := preload("res://src/gui/arrow.tscn")
onready var parent := get_parent()

# TODO: move to universal storage
enum IOType { Input, Output }

# TODO: move to universal storage
enum Direction {
	East = 1 << 0,
	South = 1 << 1,
	West = 1 << 2,
	North = 1 << 3,
}

export(Direction, FLAGS) var inputs = 0
export(Direction, FLAGS) var outputs = 0

onready var sides = {
	Direction.East: null,
	Direction.South: null,
	Direction.West: null,
	Direction.North: null,
}

func _ready():
	# TODO: find this in a better, non-hardcoded way
	var tilemap := parent.get_node("..") as TileMap

	# set cell data
	var position := tilemap.world_to_map(parent.position)
	tilemap.set_cellv(position, parent.get_instance_id())

	# TODO: make connections

func _draw():
	var d := 0
	for dir in Direction:
		if outputs & Direction[dir]:
			drawArrow(d * PI/2, IOType.Output)
		if inputs & Direction[dir]:
			drawArrow(d * PI/2, IOType.Input)
		d += 1

func drawArrow(angle: float, ioType: int):
	var color := Color.tomato if ioType == IOType.Input else Color.lawngreen
	var arrow := Arrow.instance()
	color.a = 0.8
	arrow.rotate(angle)
	arrow.find_node("body").color = color

	if ioType == IOType.Input:
		arrow.find_node("center").rotate(PI)

	add_child(arrow)
