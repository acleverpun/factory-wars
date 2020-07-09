extends Node2D

func _ready():
	pass

func addNode(Class: Resource, layerName: String, position: Vector2):
	var layer := get_node(layerName) as TileMap
	assert(layer != null)

	var node = Class.instance()
	node.position = position
	layer.add_child(node)
