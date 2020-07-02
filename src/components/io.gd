extends Polygon2D

onready var Arrow := preload("res://src/gui/arrow.tscn")

const NONE = 0
const NORTH = 1
const EAST = 1 << 1
const SOUTH = 1 << 2
const WEST = 1 << 3

const center = Vector2(8, 8)
const up = Vector2(0, -16)
const down = Vector2(0, 16)
const left = Vector2(-16, 0)
const right = Vector2(16, 0)

const inputColor = Color8(255, 255, 0, 255)

export(int, FLAGS, "North", "East", "South", "West") var inputs = 0
export(int, FLAGS, "North", "East", "South", "West") var outputs = 0

enum IOType { INPUT, OUTPUT }

func _ready():
	prints(self.get_parent().name, inputs)
	pass

func _draw():
	if inputs & NORTH:
		drawArrow(-PI/2, IOType.INPUT)
	if inputs & SOUTH:
		drawArrow(PI/2, IOType.INPUT)
	if inputs & WEST:
		drawArrow(PI, IOType.INPUT)
	if inputs & EAST:
		drawArrow(0, IOType.INPUT)

	if outputs & NORTH:
		drawArrow(-PI/2, IOType.OUTPUT)
	if outputs & SOUTH:
		drawArrow(PI/2, IOType.OUTPUT)
	if outputs & WEST:
		drawArrow(PI, IOType.OUTPUT)
	if outputs & EAST:
		drawArrow(0, IOType.OUTPUT)

func drawArrow(angle: float, ioType: int):
	var color = Color.orange if ioType == IOType.INPUT else Color.green
	var arrow = Arrow.instance()
	arrow.rotate(angle)
	arrow.color = color

	add_child(arrow)
