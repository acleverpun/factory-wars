class_name Layers extends Node

var layers := {}
var data := {}

func _ready() -> void:
	for child in get_children():
		layers[child.name] = child
		data[child.name] = {}

func getData(layer: String, position: Vector2, default = null) -> int:
	return data[layer].get(position, default)

func setData(layer: String, position: Vector2, value) -> void:
	data[layer][position] = value

func getEntity(layer: String, position: Vector2, default = null) -> Node:
	var id := getData(layer, position, default)
	if id == null: return null
	return instance_from_id(id) as Node

func setEntity(layer: String, position: Vector2, entity: Node) -> void:
	setData(layer, position, entity.get_instance_id())

# TODO: revisit
func addNode(Class: Resource, layerName: String, position: Vector2) -> void:
	assert(layers.has(layerName))
	var layer := layers[layerName] as Node

	var node = Class.instance()
	node.position = position
	layer.add_child(node)
