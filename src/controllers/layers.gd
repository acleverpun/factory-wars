class_name Layers extends Node

var entityMap := { Entity.Type.Building: {}, Entity.Type.Unit: {} }
var entitySet := { Entity.Type.Building: {}, Entity.Type.Unit: {} }
var layerMap := { Entity.Type.Building: {}, Entity.Type.Unit: {} }

func _ready() -> void:
	for layer in get_children():
		entityMap[layer.name] = {}
		entitySet[layer.name] = {}
		layerMap[layer.name] = layer

func getData(type: int, position: Vector2, default = null) -> int:
	return entityMap[type].get(position, default)

func setData(type: int, position: Vector2, value) -> void:
	entityMap[type][position] = value

func getEntity(type: int, position: Vector2, default = null) -> Node:
	var id := getData(type, position, default)
	if id == null: return null
	return instance_from_id(id) as Node

func addEntity(entity: Entity) -> void:
	var id = entity.get_instance_id()

	# set EID in map data
	setData(entity.type, grid.toGrid(entity.position), id)

	# add EID to set
	entitySet[entity.type][id] = true

func rebuildEntityMap() -> void:
	for layerName in entityMap:
		var entityMapLayer = {}
		for id in entitySet[layerName]:
			var entity: Node2D = instance_from_id(id)
			var gridPos := grid.toGrid(entity.position)
			entityMapLayer[gridPos] = entity.get_instance_id()
		entityMap[layerName] = entityMapLayer
