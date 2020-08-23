class_name Grid extends TileMap

const size = 32
const cell = Vector2(size, size)

const Right = size * Vector2.RIGHT
const Down = size * Vector2.DOWN
const Left = size * Vector2.LEFT
const Up = size * Vector2.UP

var layers = {}

func _ready() -> void:
	for child in get_children():
		layers[child.name] = child

	drawGrid()

func addNode(Class: Resource, layerName: String, position: Vector2) -> void:
	assert(layers.has(layerName))
	var layer: TileMap = layers[layerName] as TileMap

	var node = Class.instance()
	node.position = position
	layer.add_child(node)

func getData(layerName: String, position: Vector2) -> int:
	assert(layers.has(layerName))
	var layer: TileMap = layers[layerName] as TileMap
	var gridPosition := layer.world_to_map(position)
	return layer.get_cellv(gridPosition)

func setData(layerName: String, position: Vector2, value: int) -> void:
	assert(layers.has(layerName))
	var layer: TileMap = layers[layerName] as TileMap
	var gridPosition := layer.world_to_map(position)
	layer.set_cellv(gridPosition, value)

func drawGrid() -> void:
	var viewport: Viewport = $"/root"
	for x in range(0, viewport.size.x / size + 1):
		drawLine(Vector2(x * size, 0), Vector2(x * size, viewport.size.y))
	for y in range(0, viewport.size.y / size + 1):
		drawLine(Vector2(0, y * size), Vector2(viewport.size.x, y * size))

func drawLine(from, to) -> void:
	var line: Line2D = Line2D.new()
	line.width = 1
	line.default_color = ColorN("gray", 0.25)
	line.points = PoolVector2Array([ from, to ])
	self.add_child(line)
