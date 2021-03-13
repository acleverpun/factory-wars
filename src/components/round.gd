extends Node

signal changed(value)

var value: int = 0
var player: int = 0

onready var map: Map = get_node("/root/map")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.debug"):
		prints(player, value)
		prints(map.cache)
	elif Input.is_action_just_pressed("ui_accept"):
		nextRound()

func nextRound() -> void:
	player = (player + 1) % map.players
	if player == 0:
		value += 1

	emit_signal("changed", value, player)
	events.emit_signal("round:changed", value, player)
