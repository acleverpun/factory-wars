extends Node2D

func _ready():
	# set cell data
	for child in get_children():
		var tilemap := child as TileMap
		for entity in tilemap.get_children():
			var position := tilemap.world_to_map(entity.position)
			prints(tilemap.name, entity.name, tilemap.get_cellv(position))
			tilemap.set_cellv(position, 2)
