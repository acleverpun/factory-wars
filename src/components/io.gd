extends Polygon2D

onready var Arrow := preload("res://src/gui/arrow.tscn")

const NONE = 0
const NORTH = 1
const EAST = 1 << 1
const SOUTH = 1 << 2
const WEST = 1 << 3

export(int, FLAGS, "North", "East", "South", "West") var inputs = 0
export(int, FLAGS, "North", "East", "South", "West") var outputs = 0

enum IOType { INPUT, OUTPUT }

func _ready():
	prints(self.get_parent().name, inputs)
	pass

func _draw():
	if outputs & NORTH:
		drawArrow(-PI/2, IOType.OUTPUT)
	if outputs & SOUTH:
		drawArrow(PI/2, IOType.OUTPUT)
	if outputs & WEST:
		drawArrow(PI, IOType.OUTPUT)
	if outputs & EAST:
		drawArrow(0, IOType.OUTPUT)

	if inputs & NORTH:
		drawArrow(-PI/2, IOType.INPUT)
	if inputs & SOUTH:
		drawArrow(PI/2, IOType.INPUT)
	if inputs & WEST:
		drawArrow(PI, IOType.INPUT)
	if inputs & EAST:
		drawArrow(0, IOType.INPUT)

func drawArrow(angle: float, ioType: int):
	var color := Color.tomato if ioType == IOType.INPUT else Color.lawngreen
	var arrow := Arrow.instance()
	color.a = 0.8
	arrow.rotate(angle)
	arrow.find_node("body").color = color

	if ioType == IOType.INPUT:
		arrow.find_node("center").rotate(PI)

	add_child(arrow)
