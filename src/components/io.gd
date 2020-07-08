tool
extends Polygon2D

onready var Arrow := preload("res://src/gui/arrow.tscn")
onready var parent := get_parent()

export(types.DirectionFlags, FLAGS) var inputs = 0
export(types.DirectionFlags, FLAGS) var outputs = 0

onready var sides = {
	Vector2.RIGHT: null,
	Vector2.DOWN: null,
	Vector2.LEFT: null,
	Vector2.UP: null,
}

func _ready():
	# TODO: find this in a better, non-hardcoded way
	var tilemap := parent.get_node("..") as TileMap

	# set cell data
	var parentPosition := tilemap.world_to_map(parent.position)
	tilemap.set_cellv(parentPosition, parent.get_instance_id())

	# TODO: make connections

func _draw():
	var d := 0
	for dir in types.DirectionFlags:
		if outputs & types.DirectionFlags[dir]:
			drawArrow(d * PI/2, types.IO.Output)
		if inputs & types.DirectionFlags[dir]:
			drawArrow(d * PI/2, types.IO.Input)
		d += 1

func drawArrow(angle: float, ioType: int):
	var color := Color.tomato if ioType == types.IO.Input else Color.lawngreen
	var arrow := Arrow.instance()
	color.a = 0.8
	arrow.rotate(angle)
	arrow.find_node("body").color = color

	if ioType == types.IO.Input:
		arrow.find_node("center").rotate(PI)

	add_child(arrow)
