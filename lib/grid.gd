class_name Grid extends TileMap

const size = 32

const Right = size * Vector2.RIGHT
const Down = size * Vector2.DOWN
const Left = size * Vector2.LEFT
const Up = size * Vector2.UP
const One = size * Vector2.ONE

func _init() -> void:
	self.cell_size = Vector2(size, size)

func _ready() -> void:
	_drawGrid()

func toGrid(position: Vector2) -> Vector2:
	return (position / size).floor()

func toWorld(position: Vector2) -> Vector2:
	return position * size + One / 2

func snapped(position: Vector2) -> Vector2:
	var pos := position - One / 2
	return pos.snapped(One) + One / 2

func _drawLine(from, to) -> void:
	var line: Line2D = Line2D.new()
	line.width = 1
	line.default_color = ColorN("gray", 0.25)
	line.points = PoolVector2Array([ from, to ])
	self.add_child(line)

func _drawGrid() -> void:
	var viewport: Viewport = $"/root"
	for x in range(0, viewport.size.x / size + 1):
		_drawLine(Vector2(x * size, 0), Vector2(x * size, viewport.size.y))
	for y in range(0, viewport.size.y / size + 1):
		_drawLine(Vector2(0, y * size), Vector2(viewport.size.x, y * size))
