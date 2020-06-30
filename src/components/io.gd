extends Polygon2D

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

func _ready():
	prints(inputs, NORTH, EAST, SOUTH, WEST)
	pass

func _draw():
	if inputs & NORTH:
		draw_line(center, center + up, inputColor, 1)
	if inputs & SOUTH:
		draw_line(center, center + down, inputColor, 1)
	if inputs & WEST:
		draw_line(center, center + left, inputColor, 1)
	if inputs & EAST:
		draw_line(center, center + right, inputColor, 1)
