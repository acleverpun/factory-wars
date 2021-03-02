class_name Map extends Node2D

export(Cache) var cache: Cache

# TYPE: map[Vector2][int]
var entityMap := {}

# TYPE: map[int][Vector2]
var positionMap := {}

onready var source: Wrapper = $source

# TODO: consider removing
# NOTE: would be in a generic storage class
func getData(position: Vector2, default = null) -> int:
	return entityMap.get(position, default)

# TODO: consider removing
# NOTE: would be in a generic storage class
func setData(position: Vector2, value) -> void:
	entityMap[position] = value

func getEntity(position: Vector2, default = null) -> Entity:
	var id := getData(position, default)
	if id == null: return null
	return instance_from_id(id) as Entity

func addEntity(entity: Entity) -> void:
	var id := entity.get_instance_id()
	var cell := grid.toGrid(entity.position)

	# update data structures
	# setData(cell, id)
	entityMap[cell] = id
	positionMap[id] = cell

func updateEntity(entity: Entity) -> void:
	var id := entity.get_instance_id()
	var cell := grid.toGrid(entity.position)
	var oldCell: Vector2 = positionMap[id]

	# set new values
	positionMap[id] = cell
	entityMap[cell] = id

	# unset old values
	entityMap.erase(oldCell)

func updateEntityMap() -> void:
	for id in positionMap:
		var entity: Node2D = instance_from_id(id)
		var cell := grid.toGrid(entity.position)
		entityMap[cell] = entity.get_instance_id()

func _on_round_changed(currentRound: int) -> void:
	cache.add(source.value)
	prints("map: round changed", currentRound, cache.money)
