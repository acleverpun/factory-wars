class_name Grid extends Node2D

const size = 32
const cell = Vector2(size, size)

const Right = size * Vector2.RIGHT
const Down = size * Vector2.DOWN
const Left = size * Vector2.LEFT
const Up = size * Vector2.UP

# TODO: make layer enum or const dict or something

func _ready():
	pass

func addNode(Class: Resource, layerName: String, position: Vector2):
	var layer := get_node(layerName) as TileMap
	assert(layer != null)

	var node = Class.instance()
	node.position = position
	layer.add_child(node)
