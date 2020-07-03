extends Node

var value: int

func _ready():
	value = 0

func _input(event: InputEvent):
	if Input.is_action_just_pressed("game.debug"):
		prints(value)
	elif Input.is_action_just_pressed("ui_accept"):
		next()

func next():
	value += 1
	events.emit_signal("round:next", value)
