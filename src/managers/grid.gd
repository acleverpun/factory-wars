extends Node2D

func _ready():
	# set cell data
	for _tilemap in get_children():
		var tilemap := _tilemap as TileMap
		for _entity in tilemap.get_children():
			var entity := _entity as Node

			var position := tilemap.world_to_map(entity.position)
			prints(tilemap.name, entity.name, entity.get_instance_id(), tilemap.get_cellv(position))
			tilemap.set_cellv(position, entity.get_instance_id())
