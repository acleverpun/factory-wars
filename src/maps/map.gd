class_name Map extends Node2D

# TYPE: map[Entity.Type][map[Vector2][int]]
var entityMap := { Entity.Type.Building: {}, Entity.Type.Unit: {} }

# TYPE: map[Entity.Type][map[int][Vector2]]
var positionMap := { Entity.Type.Building: {}, Entity.Type.Unit: {} }

# TODO: consider removing
# NOTE: would be in a generic storage class
func getData(type: int, position: Vector2, default = null) -> int:
	return entityMap[type].get(position, default)

# TODO: consider removing
# NOTE: would be in a generic storage class
func setData(type: int, position: Vector2, value) -> void:
	entityMap[type][position] = value

func getEntity(type: int, position: Vector2, default = null) -> Node:
	var id := getData(type, position, default)
	if id == null: return null
	return instance_from_id(id) as Node

func addEntity(entity: Entity) -> void:
	var id := entity.get_instance_id()
	var cell := grid.toGrid(entity.position)

	# update data structures
	# setData(entity.type, cell, id)
	entityMap[entity.type][cell] = id
	positionMap[entity.type][id] = cell

func updateEntity(entity: Entity) -> void:
	var id := entity.get_instance_id()
	var cell := grid.toGrid(entity.position)
	var oldCell: Vector2 = positionMap[entity.type][id]

	# set new values
	positionMap[entity.type][id] = cell
	entityMap[entity.type][cell] = id

	# unset old values
	entityMap[entity.type].erase(oldCell)

func updateEntityMap() -> void:
	for layerName in entityMap:
		var entityMapLayer = {}
		for id in positionMap[layerName]:
			var entity: Node2D = instance_from_id(id)
			var cell := grid.toGrid(entity.position)
			entityMapLayer[cell] = entity.get_instance_id()
		entityMap[layerName] = entityMapLayer
