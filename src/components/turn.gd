extends Node

signal changed(_turn, _commander)

var _commander: int = 0
var _turn: int = 0

onready var map: Map = get_node("/root/map")

func _input(event: InputEvent) -> void:
	if not event.is_action_type(): return

	if Input.is_action_just_released("game.debug"):
		prints(_commander, _turn)
		prints(map.commander.cache)
	elif Input.is_action_just_released("ui_accept"):
		nextTurn()

func nextTurn() -> void:
	_commander = (_commander + 1) % len(map.commanders)
	if _commander == 0:
		_turn += 1

	emit_signal("changed", _turn, _commander)
	events.emit_signal("turn:changed", _turn, _commander)
