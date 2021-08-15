extends Node2D

@export var model: Stage

func _on_turn_changed(team: int, turn: int) -> void:
	prints("team: %s | turn: %s" % [ team, turn ])

	for entity in get_children():
		if not (entity is Entity) or entity.team != team: continue

		if entity.has_method("setup"):
			entity.call("setup", turn)
