class_name Grid extends Node2D

const size = 32
const cell = Vector2(size, size)

const Right = size * Vector2.RIGHT
const Down = size * Vector2.DOWN
const Left = size * Vector2.LEFT
const Up = size * Vector2.UP

var layers = {}

func _ready():
	for child in get_children():
		layers[child.name] = child

func addNode(Class: Resource, layerName: String, position: Vector2):
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
