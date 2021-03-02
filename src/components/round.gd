extends Node

signal changed(value)

var value: int

func _ready() -> void:
	value = 0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.debug"):
		prints(value)
		prints(get_node("/root/map").cache)
	elif Input.is_action_just_pressed("ui_accept"):
		nextRound()

func nextRound() -> void:
	value += 1
	emit_signal("changed", value)
	events.emit_signal("round:changed", value)
