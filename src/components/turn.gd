extends Node

signal changed(_turn, _commander)

var _commander: int = 0
var _turn: int = 0

onready var stage: Stage = get_node("/root/stage")

func _input(event: InputEvent) -> void:
	if not event.is_action_type(): return

	if Input.is_action_just_released("game.debug"):
		prints(_commander, _turn)
		prints(stage.commander.cache)
	elif Input.is_action_just_released("ui_accept"):
		nextTurn()

func nextTurn() -> void:
	_commander = (_commander + 1) % len(stage.commanders)
	if _commander == 0:
		_turn += 1

	emit_signal("changed", _turn, _commander)
	events.emit_signal("turn:changed", _turn, _commander)
