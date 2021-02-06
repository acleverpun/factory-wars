class_name Grid extends TileMap

const size = 32

const Right = size * Vector2.RIGHT
const Down = size * Vector2.DOWN
const Left = size * Vector2.LEFT
const Up = size * Vector2.UP
const One = size * Vector2.ONE

var store := {}
var layers := {}

func _init() -> void:
	self.cell_size = Vector2(size, size)

func _ready() -> void:
	for child in get_children():
		layers[child.name] = child

	_drawGrid()

func addNode(Class: Resource, layerName: String, position: Vector2) -> void:
	assert(layers.has(layerName))
	var layer: TileMap = layers[layerName] as TileMap

	var node = Class.instance()
	node.position = position
	layer.add_child(node)

func getAllData(position: Vector2) -> Dictionary:
	var key := self.world_to_map(position)
	if store.get(key) == null: store[key] = {}
	return store.get(key)

func getData(position: Vector2, type: String, default = null):
	var result = getAllData(position).get(type)
	if result == null: return default
	return result

func setData(position: Vector2, type: String, value) -> void:
	getAllData(position)[type] = value

func toGrid(position: Vector2) -> Vector2:
	return (position / size).floor()

func toWorld(position: Vector2) -> Vector2:
	return position * size + One / 2

func snapped(position: Vector2) -> Vector2:
	var pos := position - One / 2
	return pos.snapped(One) + One / 2

func _drawGrid() -> void:
	var viewport: Viewport = $"/root"
	for x in range(0, viewport.size.x / size + 1):
		_drawLine(Vector2(x * size, 0), Vector2(x * size, viewport.size.y))
	for y in range(0, viewport.size.y / size + 1):
		_drawLine(Vector2(0, y * size), Vector2(viewport.size.x, y * size))

func _drawLine(from, to) -> void:
	var line: Line2D = Line2D.new()
	line.width = 1
	line.default_color = ColorN("gray", 0.25)
	line.points = PoolVector2Array([ from, to ])
	self.add_child(line)
