tool
class_name IO extends Polygon2D

export(types.DirectionFlags, FLAGS) var inputs = 0
export(types.DirectionFlags, FLAGS) var outputs = 0

onready var Arrow := preload("res://src/gui/arrow.tscn")
onready var parent := get_parent()
onready var instanceId := parent.get_instance_id()
# TODO: find this in a better, non-hardcoded way
onready var tilemap := parent.get_node("..") as TileMap

onready var sides = {}

func _ready():
	if Engine.editor_hint: return

	# set cell data
	var gridPosition := tilemap.world_to_map(parent.position)
	tilemap.set_cellv(gridPosition, instanceId)

	# make connections
	for dir in types.Direction:
		if inputs & types.DirectionFlags[dir] or outputs & types.DirectionFlags[dir]:
			var otherId = tilemap.get_cellv(gridPosition + types.Direction[dir])
			if otherId == -1: return

			var otherNode := instance_from_id(otherId) as Node
			if !otherNode: return

			var otherIO := otherNode.get_node("io") as IO
			if !otherIO: return

			self.addConnection(otherIO, types.Direction[dir])
			otherIO.addConnection(self, -1 * types.Direction[dir])

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

func addConnection(otherIO: IO, dir: Vector2):
	sides[dir] = otherIO
