tool
class_name IO extends Component

export(types.DirectionFlags, FLAGS) var inputs = 0
export(types.DirectionFlags, FLAGS) var outputs = 0

onready var Arrow := preload("res://src/gui/arrow.tscn")

onready var sides = {}

func _ready() -> void:
	if Engine.editor_hint: return
	# call_deferred("setup")
	self.entity.connect("draw", self, "_draw")

# TODO: revisit
func setup() -> void:
	pass
	# # set cell data
	# var position: Vector2 = self.entity.position
  #
	# # make connections
	# for dir in types.Direction:
	# 	if inputs & types.DirectionFlags[dir] or outputs & types.DirectionFlags[dir]:
	# 		var otherId = self.map.getData(position + Grid[dir])
	# 		if !otherId: continue
  #
	# 		var otherIO: IO = instance_from_id(otherId)
	# 		if !otherIO: continue
  #
	# 		self.addConnection(otherIO, types.Direction[dir])
	# 		otherIO.addConnection(self, -1 * types.Direction[dir])

func _draw() -> void:
	var d := 0
	for dir in types.DirectionFlags:
		if outputs & types.DirectionFlags[dir]:
			drawArrow(d * PI/2, types.IO.Output)
		if inputs & types.DirectionFlags[dir]:
			drawArrow(d * PI/2, types.IO.Input)
		d += 1

func drawArrow(angle: float, ioType: int) -> void:
	var color := Color.tomato if ioType == types.IO.Input else Color.lawngreen
	var arrow := Arrow.instance()
	color.a = 0.8
	arrow.rotate(angle)
	arrow.find_node("body").color = color

	if ioType == types.IO.Input:
		arrow.find_node("center").rotate(PI)

	self.entity.add_child(arrow)

func addConnection(otherIO: IO, dir: Vector2) -> void:
	sides[dir] = otherIO
